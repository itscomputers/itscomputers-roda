module Views
  class Root < Views::Base
    Link = Struct.new(:text, :url)

    LINKS = [
      Link.new("advent of code", "https://github.com/itscomputers/advent_of_code"),
      Link.new("is it friday the 13th??", "https://fridaythe13th.itscomputers.lol"),
      Link.new("archimedes cattle problem", "/archimedes_cattle_problem"),
      Link.new("ebe - number theory for programmers", "/ebe"),
    ]

    def links
      LINKS
    end
  end
end
