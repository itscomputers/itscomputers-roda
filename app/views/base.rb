module Views
  class Base
    def initialize(params)
      @params = params
    end

    def title=(title)
      @title = title
    end

    def title
      @title || "its computers"
    end
  end
end

