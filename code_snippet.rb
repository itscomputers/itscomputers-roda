class CodeSnippet
  def self.get(file_name, method_name:)
    new(file_name, method_name).build
  end

  def self.wrap(module_name, *snippets)
    [
      "module #{module_name}",
      snippets.map { |snippet| snippet.split("\n").map { |line| "  #{line}" }.join("\n") }.join("\n\n"),
      "end"
    ].join("\n")
  end

  def initialize(file_name, method_name)
    @file_name = file_name
    @method_name = method_name
  end

  def build
    @snippet ||= lines.join
  end

  def lines
    @lines ||= [
      *File.readlines(@file_name)
        .drop_while { |line| !line.match /def #{@method_name}/ }
        .tap { |array| @spaces = array.first.chars.take_while { |ch| ch == " " }.join }
        .take_while { |line| !line.match end_line },
      end_line,
    ].map { |line| line.split(@spaces).drop(1).join }
  end

  def end_line
    "#{@spaces}end"
  end
end

