module Views::Ebe
  class LinearCombinations < Views::Base
    def number
      integer_param "number"
    end

    def other
      integer_param "other"
    end

    def example_coefficients
      (-20..20).to_a.product((-20..20).to_a).sample(6).to_a
    end

    def examples
      example_coefficients.map do |(coeff, other_coeff)|
        {
          :coeff => coeff,
          :other_coeff => other_coeff,
          :total => number * coeff + other * other_coeff
        }
      end.sort_by { |example| example[:total] }
    end

    def solution?
      !number.nil? && !other.nil?
    end
  end
end
