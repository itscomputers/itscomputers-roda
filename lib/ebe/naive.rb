module Ebe
  module Naive
    module_function

    def divides?(b, a)
      return false if b == 0

      multiple = 0
      while multiple.abs < a.abs
        if a * b < 0
          multiple -= b
        else
          multiple += b
        end
      end

      multiple == a
    end
  end
end

