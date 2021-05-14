require 'roda'
require_relative './helpers/divisibility'
require_relative './lib/examples/divisibility'

class App < Roda
  plugin :render

  route do |r|
    r.on "divisibility" do
      r.get do
        view "divisibility"
      end

      r.post do
        @example = Examples::Divisibility.new(r.params)
        view "divisibility"
      end
    end
  end

  include Helpers::Divisibility
end

