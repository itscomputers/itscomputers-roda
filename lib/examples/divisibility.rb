module Examples
  class Divisibility
    attr_reader :dividend, :divisor

    def initialize(params)
      @dividend = params['dividend'].to_i
      @divisor = params['divisor'].to_i
    end

    def boolean_answer
      @divisor != 0 && @dividend % @divisor == 0
    end

    def answer
      boolean_answer ? "yes" : "no"
    end

    def reason
      if @divisor == 0
        "Zero does not divide any number"
      elsif @dividend % @divisor != 0
        does_not_divide
      else
        does_divide
      end
    end

    private

    def does_not_divide
      [
        "<code>#{@dividend}</code>",
        "is between",
        multipliers.map { |m| "<code>#{@divisor} * #{m}</code>" }.join(" and "),
      ].join(" ")
    end

    def does_divide
      "<code>#{@dividend} == #{@divisor} * #{@dividend / @divisor}</code>"
    end

    def multiplier_offset
      (@dividend / @divisor) * @divisor < @dividend ? 1 : -1
    end

    def multipliers
      [0, multiplier_offset]
        .map { |offset| @dividend / @divisor + offset }
        .sort_by { |multiplier| @divisor * multiplier }
    end
  end
end

