module Views::Ebe
  class CommonDivisors < Views::Base
    EXAMPLES = [
      {inputs: [0, 25], common_divisors: [1, 5, 25]},
      {inputs: [25, 0], common_divisors: [1, 5, 25]},
      {inputs: [25, 30], common_divisors: [1, 5]},
      {inputs: [23, 30], common_divisors: [1]},
      {inputs: [30, 90], common_divisors: [1, 2, 3, 5, 6, 10, 15, 30]},
      {inputs: [50, 70], common_divisors: [1, 2, 5, 10]},
      {inputs: [11, 13], common_divisors: [1]},
      {inputs: [12, 14], common_divisors: [1, 2]},
    ]

    def maximum
      50000
    end

    def number
      integer_param "number"
    end

    def other
      integer_param "other"
    end

    def common_divisors_code_snippet
      code_snippet(
        filename: "division.rb",
        method_name: "common_divisors",
        module_name: "Division",
      )
    end

    def common_divisors_examples
      EXAMPLES
    end
  end
end
