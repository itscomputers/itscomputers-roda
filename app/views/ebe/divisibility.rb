module Views::Ebe
  class Divisibility
    EXAMPLES = [
      { :divisor =>  15, :dividend =>  45, :divides? => true },
      { :divisor => -15, :dividend =>  45, :divides? => true },
      { :divisor =>  15, :dividend => -45, :divides? => true },
      { :divisor => -15, :dividend => -45, :divides? => true },
      { :divisor =>  10, :dividend =>  45, :divides? => false },
      { :divisor => -10, :dividend =>  45, :divides? => false },
      { :divisor =>  10, :dividend => -45, :divides? => false },
      { :divisor => -10, :dividend => -45, :divides? => false },
      { :divisor =>   7, :dividend =>   0, :divides? => true },
      { :divisor =>   7, :dividend =>   7, :divides? => true },
      { :divisor =>   7, :dividend =>  -7, :divides? => true },
      { :divisor =>   1, :dividend =>   7, :divides? => true },
      { :divisor =>  -1, :dividend =>   7, :divides? => true },
      { :divisor =>   0, :dividend =>   7, :divides? => false },
    ]

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
      @div_rem ||= Ebe.div_rem dividend, divisor
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

    def naive_divides?(b, a)
      Ebe::Naive.divides?(b, a)
    end

    def divides_examples
      EXAMPLES
    end
  end
end

