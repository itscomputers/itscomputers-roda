module Ebe
  module Division
    def divides(b, a)
      b != 0 && a % b == 0
    end

    def div_rem(a, b)
      remainder = a % b
      remainder += b.abs if remainder < 0
      quotient = (a - remainder) / b
      [quotient, remainder]
    end

    def div(a, b)
      div_rem(a, b).first
    end

    def rem(a, b)
      div_rem(a, b).last
    end

    def divisors(a)
      return if a == 0
      (1..a.abs).select { |b| divides(b, a) }
    end

    def common_divisors(a, b)
      return divisors(a) if b == 0
      return divisors(b) if a == 0
      upper = [a.abs, b.abs].min
      (1..upper).select { |d| divides(d, a) && divides(d, b) }
    end
  end
end
