module Views::Ebe
  class Divisors < Views::Base
    EXAMPLES = [
      {integer: 25, divisors: [1, 5, 25]},
      {integer: 27, divisors: [1, 3, 9, 27]},
      {integer: 29, divisors: [1, 29]},
      {integer: 30, divisors: [1, 2, 3, 5, 6, 10, 15, 30]},
      {integer: 32, divisors: [1, 2, 4, 8, 16, 32]},
      {integer: 34, divisors: [1, 2, 17, 34]},
      {integer: 36, divisors: [1, 2, 3, 4, 6, 9, 12, 18, 36]}
    ]

    def maximum
      50000
    end

    def raw_integer
      @params["integer"]&.to_i
    end

    def integer
      !raw_integer.nil? && raw_integer <= maximum && raw_integer
    end

    def divisors
      Ebe.divisors(integer)
    end

    def divisors_snippet
      code_snippet(
        filename: "division.rb",
        method_name: "divisors",
        module_name: "Division",
      )
    end

    def divisors_examples
      EXAMPLES
    end
  end
end
