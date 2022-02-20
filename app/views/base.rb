module Views
  class Base
    def initialize(params)
      @params = params
    end

    attr_writer :title

    def title
      @title || "its computers"
    end
  end
end
