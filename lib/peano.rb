module Peano
  INTEGER_LOOKUP = {}

  module_function

  def integer(n)
    if n.to_i != n || n < 0
      raise ArgumentError.new("#{n} is not a natural number")
    end

    INTEGER_LOOKUP[n] ||= (n == 0) ?
      Integer.zero :
      integer(n - 1).successor
  end

  class Integer
    include Comparable

    def self.zero
      Integer.new([])
    end

    attr_reader :array

    def initialize(array)
      @array = array
    end

    def inspect
      # eg the number "4" is displayed as [0, 1, 2, 3]
      @array.map(&:size)
    end

    def zero?
      @array.empty?
    end

    def successor
      Integer.new(@array + [@array])
    end

    def predecessor
      return if zero?
      Integer.new(@array.take(@array.size - 1))
    end

    def +(other)
      return self if other.zero?
      (self + other.predecessor).successor
    end

    def *(other)
      return Integer.zero if other.zero?
      self + (self * other.predecessor)
    end

    def <=>(other)
      return 0 if @array == other.array
      return -1 if (@array - other.array).empty?
      return 1 if (other.array - @array).empty?
      nil
    end

    def to_i
      @array.size
    end
  end
end
