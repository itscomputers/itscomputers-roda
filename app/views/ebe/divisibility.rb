module Views::Ebe
  class Divisibility < Views::Base
    EXAMPLES = [
      {divisor: 15, dividend: 45, divides?: true},
      {divisor: -15, dividend: 45, divides?: true},
      {divisor: 15, dividend: -45, divides?: true},
      {divisor: -15, dividend: -45, divides?: true},
      {divisor: 10, dividend: 45, divides?: false},
      {divisor: -10, dividend: 45, divides?: false},
      {divisor: 10, dividend: -45, divides?: false},
      {divisor: -10, dividend: -45, divides?: false},
      {divisor: 7, dividend: 0, divides?: true},
      {divisor: 7, dividend: 7, divides?: true},
      {divisor: 7, dividend: -7, divides?: true},
      {divisor: 1, dividend: 7, divides?: true},
      {divisor: -1, dividend: 7, divides?: true},
      {divisor: 0, dividend: 7, divides?: false}
    ]

    def divisor
      @params["divisor"]&.to_i
    end

    def dividend
      @params["dividend"]&.to_i
    end

    def naive_code_snippet
      CodeSnippet.wrap(
        "module NumberTheory::Naive",
        CodeSnippet.get("lib/ebe/naive.rb", method_name: "divides"),
      )
    end

    def divides_examples
      EXAMPLES
    end
  end
end
