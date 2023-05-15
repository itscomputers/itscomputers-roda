module Views::NumberTheory
  class DivisionWithRemainder < Views::Base
    EXAMPLES = [
      {dividend: 47, divisor: 10, quotient: 4, remainder: 7},
      {dividend: 47, divisor: -10, quotient: -4, remainder: 7},
      {dividend: -47, divisor: 10, quotient: -5, remainder: 3},
      {dividend: -47, divisor: -10, quotient: 5, remainder: 3},
      {dividend: 90, divisor: 10, quotient: 9, remainder: 0},
      {dividend: 90, divisor: -10, quotient: -9, remainder: 0},
      {dividend: -90, divisor: 10, quotient: -9, remainder: 0},
      {dividend: -90, divisor: -10, quotient: 9, remainder: 0},
      {dividend: 10, divisor: 47, quotient: 0, remainder: 10},
      {dividend: 10, divisor: -47, quotient: 0, remainder: 10},
      {dividend: -10, divisor: 47, quotient: -1, remainder: 37},
      {dividend: -10, divisor: -47, quotient: 1, remainder: 37},
      {dividend: 0, divisor: 99, quotient: 0, remainder: 0},
      {dividend: 0, divisor: -99, quotient: 0, remainder: 0},
    ]

    def dividend
      integer_param "dividend"
    end

    def divisor
      integer_param "divisor"
    end

    def div_rem(a, b)
      Ebe.div_rem(a, b)
    end

    def examples
      EXAMPLES
    end

    def code_snippet
      CodeSnippet.wrap(
        "module Naive",
        CodeSnippet.get("lib/ebe/naive.rb", method_name: "div_rem"),
      )
    end
  end
end
