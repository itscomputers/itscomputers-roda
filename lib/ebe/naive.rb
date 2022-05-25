module Ebe
  module Naive
    module_function

    def divides(b, a)
      return false if b == 0
      return divides(-b, a) if b < 0
      return divides(b, -a) if a < 0

      multiple = 0

      while multiple < a
        multiple += b
      end

      multiple == a
    end

    def div_rem(a, b)
      raise ZeroDivisionError if b == 0

      if b < 0
        quotient, remainder = div_rem(a, -b)
        return [-quotient, remainder]
      end

      if a < 0
        quotient, remainder = div_rem(-a, b)
        return [-quotient, 0] if remainder == 0
        return [-quotient - 1, -remainder + b.abs]
      end

      quotient = 0

      until (remainder = a - quotient * b) < b.abs
        quotient += 1
      end

      [quotient, remainder]
    end
  end
end
