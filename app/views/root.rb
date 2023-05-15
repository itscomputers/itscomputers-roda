module Views
  class Root < Views::Base
    Link = Struct.new(:text, :url)

    LINKS = [
      Link.new("advent of code", "https://github.com/itscomputers/advent_of_code"),
      Link.new("is it friday the 13th??", "https://fridaythe13th.itscomputers.lol"),
      Link.new("archimedes cattle problem", "/archimedes_cattle_problem"),
      Link.new("number theory for programmers", "/number_theory"),
    ]

    NAV = [
      Link.new("its computers", "/"),
      Link.new("number theory", "/number_theory"),
    ]

    def links
      LINKS
    end

    def nav
      NAV
    end
  end
end
