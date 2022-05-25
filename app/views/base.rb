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
      @params[key]&.to_i
    end

    def code_snippet(filename:, method_name:, module_name: nil)
      path = "lib/ebe/#{filename}"
      CodeSnippet.wrap(
        "module #{["NumberTheory", module_name].compact.join("::")}",
        CodeSnippet.get(path, method_name: method_name),
      )
    end
  end
end

