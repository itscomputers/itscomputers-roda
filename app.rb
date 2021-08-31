require 'roda'
require_relative './view'
require_relative './code_snippet'

class App < Roda
  plugin :assets, js: ["application.js"]
  plugin :render,
    engine: "slim",
    views: "templates"

  route do |r|
    r.assets

    r.on "ebe" do
      r.on "divisibility" do
        @ruby = CodeSnippet.wrap "module Naive", CodeSnippet.get("lib/ebe/naive.rb", method_name: "divides?")
        @view = View::Ebe::Divisibility.new(r.params)
        view "ebe/divisibility"
      end
    end
  end
end

