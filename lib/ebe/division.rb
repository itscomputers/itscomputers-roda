module Ebe
  module Division
    def divides(b, a)
      b != 0 && a % b == 0
    end

    def divisors(a)
      return if a == 0
      (1..a.abs).select { |b| Ebe.divides(b, a) }
    end

    def div_rem(a, b)
      remainder = a % b
      remainder += b.abs if remainder < 0
      quotient = (a - remainder) / b
      [quotient, remainder]
    end

    def common_divisors(a, b)
      return divisors(a) if b == 0
      return divisors(b) if a == 0
      upper = [a.abs, b.abs].min
      (1..upper).select { |d| Ebe.divides(d, a) && Ebe.divides(d, b) }
    end
  end
end
