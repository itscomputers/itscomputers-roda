require_relative '../../lib/ebe/division'

module View::Ebe
  class Divisibility
    def initialize(params)
      @params = params
    end

    def divisor
      @params['divisor']&.to_i
    end

    def dividend
      @params['dividend']&.to_i
    end

    def div_rem
      return [] unless dividend && divisor && divisor != 0
      @div_rem ||= Ebe::Division.div_rem dividend, divisor
    end

    def quotient
      div_rem.first
    end

    def multipliers
      [quotient, quotient + 1].sort_by { |m| m * divisor }
    end

    def divides?
      div_rem.last == 0
    end
  end
end

