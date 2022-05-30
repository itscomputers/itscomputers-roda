module Views::Ebe
  class RemaindersInProgramming < Views::Base
    def euclidean_example
      <<~EUCLIDEAN
        47 div 10 ~> 4
        47 mod 10 ~> 7

        47 div -10 ~> -4
        47 mod -10 ~> 7

        -47 div 10 ~> -5
        -47 mod 10 ~> 3

        -47 div -10 ~> 5
        -47 mod -10 ~> 3
      EUCLIDEAN
    end

    def floored_example
      <<~EUCLIDEAN
        47 div 10 ~> 4
        47 mod 10 ~> 7

        47 div -10 ~> -5
        47 mod -10 ~> -3

        -47 div 10 ~> -5
        -47 mod 10 ~> 3

        -47 div -10 ~> 4
        -47 mod -10 ~> -7
      EUCLIDEAN
    end

    def rounded_example
      <<~ROUNDED
        47 div 10 ~> 5
        47 mod 10 ~> -3

        47 div -10 ~> -5
        47 mod -10 ~> -3

        -47 div 10 ~> -5
        -47 mod 10 ~> 3

        -47 div -10 ~> 5
        -47 mod -10 ~> 3
      ROUNDED
    end

    def truncated_example
      <<~EUCLIDEAN
        47 div 10 ~> 4
        47 mod 10 ~> 7

        47 div -10 ~> -4
        47 mod -10 ~> 7

        -47 div 10 ~> -4
        -47 mod 10 ~> -7

        -47 div -10 ~> 4
        -47 mod -10 ~> -7
      EUCLIDEAN
    end

    def divides_examples
      Views::Ebe::Divisibility::EXAMPLES
    end

    def div_rem_examples
      Views::Ebe::DivisionWithRemainder::EXAMPLES
    end

    def code_snippet(method_name)
      CodeSnippet.wrap(
        "module NumberTheory::Division",
        CodeSnippet.get("lib/ebe/division.rb", method_name: method_name),
      )
    end
  end
end
