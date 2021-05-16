require 'roda'
require_relative './helpers'
require_relative './code_snippet'

class App < Roda
  plugin :render, engine: 'slim'

  route do |r|
    r.on "divisibility" do
      @ruby_code = CodeSnippet.wrap(
        "Division",
        CodeSnippet.get("lib/ebe/division.rb", method_name: "divides?"),
      )

      r.get do
        @h = OpenStruct.new
        view "divisibility"
      end

      r.post do
        @h = Helpers::Divisibility.new(r.params)
        view "divisibility"
      end
    end
  end
end

