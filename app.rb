require "roda"
require "securerandom"
require "tilt/sass"

require_relative "./lib/ebe"
require_relative "./app/views"
require_relative "./app/code_snippet"

class App < Roda
  plugin :public
  plugin :assets,
    css: ["prism.css", "application.scss"],
    js: ["application.js", "prism.js"]

  plugin :render,
    engine: "slim",
    views: "app/templates"

  plugin :sessions, secret: ENV["SESSION_SECRET"] || SecureRandom.base64(64)

  plugin :route_csrf

  route do |r|
    r.assets
    r.public

    check_csrf!

    @root = Views::Root.new(r.params)

    r.root do
      @view = @root
      view "root"
    end

    r.get "archimedes_cattle_problem" do
      @view = Views::ArchimedesCattleProblem.new(r.params)
      view "archimedes_cattle_problem"
    end

    r.on "number_theory" do
      @contents = Views::NumberTheory::TableOfContents.new(r.params)

      @contents.sections.values.drop(1).flatten.each do |section|
        route = section.id.to_s

        r.on section.id.to_s do
          @contents.section = section
          @scroll = r.params["scroll"]
          @view = get_view(section, route: r)
          view "number_theory/#{route}", layout: "number_theory/layout"
        end
      end

      r.get do
        @view = @contents.tap { |v| v.title = "number theory for programmers" }
        view "number_theory/table_of_contents"
      end
    end
  end

  def get_view(section, route:)
    class_name = section.id.to_s.split("_").map(&:capitalize).join
    Views::NumberTheory.module_eval(class_name).new(route.params).tap do |view|
      view.title = section.title
    end
  rescue NameError
    Views::Base.new(route.params)
  end
end

