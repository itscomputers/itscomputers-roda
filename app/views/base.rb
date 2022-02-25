module Views
  class Base
    def initialize(params)
      @params = params
    end

    attr_writer :title

    def title
      @title || "its computers"
    end

    def integer_param(key)
      return @params[key]&.to_i
    end
  end
end
