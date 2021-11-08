require 'roda'
require 'tilt/sass'

require_relative './lib/ebe'
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

    r.on "ebe" do
      @contents = Views::Ebe::TableOfContents.new(r.params)

      @contents.sections.each do |section|
        route = section.to_s

        r.on route do
          @contents.section = section
          view_class_name = route.split("_").map(&:capitalize).join
          @view = Views::Ebe.module_eval(view_class_name).new(r.params)
          view "ebe/#{route}", :layout => "ebe/layout"
        end
      end
    end
  end
end

