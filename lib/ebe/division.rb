module Ebe
  module Division
    def divides?(b, a)
      b != 0 && a % b == 0
    end

    def div_rem(a, b)
      remainder = a % b
      remainder += b.abs if remainder < 0
      quotient = (a - remainder) / b
      [quotient, remainder]
    end
  end
end

