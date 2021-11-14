require 'roda'
require 'tilt/sass'

require_relative './lib/ebe'
require_relative './app/views/base'
require_relative './app/views'
require_relative './app/code_snippet'

class App < Roda
  plugin :assets,
    css: ["prism.css", "application.scss"],
    js: ["application.js", "prism.js"]

  plugin :render,
    engine: "slim",
    views: "app/templates"

  route do |r|
    r.assets

    r.root do
      @view = Views::Root.new(r.params)
      view "root"
    end

    r.get "archimedes_cattle_problem" do
      @view = Views::ArchimedesCattleProblem.new(r.params)
      view "archimedes_cattle_problem"
    end

    r.on "ebe" do
      @contents = Views::Ebe::TableOfContents.new(r.params)

      @contents.sections.each do |section|
        route = section.to_s

        r.on route do
          @contents.section = section
          view_class_name = route.split("_").map(&:capitalize).join
          @view = Views::Ebe.module_eval(view_class_name).new(r.params).tap do |v|
            v.title = "ebe - #{@contents.title_lookup.dig(section)}"
          end
          view "ebe/#{route}", :layout => "ebe/layout"
        end
      end

      r.get do
        @view = @contents.tap { |v| v.title = "ebe - number theory for programmers" }
        view "ebe/table_of_contents"
      end
    end
  end
end

