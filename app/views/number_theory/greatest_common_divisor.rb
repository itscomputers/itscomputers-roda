module Views::NumberTheory
  class GreatestCommonDivisor < Views::Base
    def maximum
      50000
    end

    def number
      integer_param "number"
    end

    def other
      integer_param "other"
    end
  end
end
