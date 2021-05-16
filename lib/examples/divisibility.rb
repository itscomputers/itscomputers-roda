module Examples
  class Divisibility
    attr_reader :dividend, :divisor

    def initialize(divisor, dividend)
      @dividend = params['dividend'].to_i
      @divisor = params['divisor'].to_i
      @format = format
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
        @format.call(@dividend),
        "is between",
        multipliers.map { |m| @format.call "#{@divisor} * #{m}" }.join(" and "),
      ].join(" ")
    end

    def does_divide
      @format.call "#{@dividend} == #{@divisor} * #{@dividend / @divisor}"
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

