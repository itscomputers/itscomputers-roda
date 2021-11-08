module Ebe
  module Naive
    module_function

    def divides(b, a)
      return false if b == 0

      multiple = 0
      direction = (a * b < 0) ? -1 : 1

      while multiple.abs < a.abs
        multiple += direction * b
      end

      multiple == a
    end
  end
end

