module Helpers
  module Divisibility
    def divisibility_statements(divisor, dividend, divisible: nil)
      divisible = divisor != 0 && dividend % divisor == 0 if divisible.nil?
      connectors = divisible ? [
        "divides",
        "is a divisor of",
        "is divisible by",
        "is a multiple of",
      ] : [
        "does not divide",
        "is not a divisor of",
        "is not divisible by",
        "is not a multiple of",
      ]
      connectors.map.with_index do |connector, index|
        numbers = [divisor, dividend].map { |number| "<code>#{number}</code>" }
        numbers = numbers.reverse if index > 1
        numbers.join " #{connector} "
      end
    end
  end
end

