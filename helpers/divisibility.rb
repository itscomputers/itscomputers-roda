require_relative '../lib/ebe/division'

module Helpers
  class Divisibility
    attr_reader :divisor, :dividend, :quotient

    def initialize(params)
      @divisor = params['divisor'].to_i
      @dividend = params['dividend'].to_i
      @quotient, *_ = Ebe::Division.div_rem @dividend, @divisor unless @divisor == 0
    end

    def has_example?
      true
    end

    def forward_connectors
      divides? ?
        ["divides", "is a divisor of"] :
        ["does not divide", "is not a divisor of"]
    end

    def backward_connectors
      divides? ?
        ["is divisible by", "is a multiple of"] :
        ["is not divisible by", "is not a multiple of"]
    end

    def multipliers
      [@quotient, @quotient + 1].sort_by { |m| m * @divisor }
    end

    def divides?
      @remainder == 0
    end

    def example_answer
      divides? ? "yes" : "no"
    end

    def divides_symbol
      divides? ? "|" : "\u2224"
    end
  end
end

