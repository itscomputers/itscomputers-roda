module Views::NumberTheory
  class Section
    attr_reader :id, :title
    attr_accessor :prev_section, :next_section, :section_number, :subsection_number

    def initialize(id, title: nil)
      @id = id
      @title = title || id.to_s.tr("_", " ")
    end

    def url
      "/number_theory/#{id}"
    end

    def number
      return nil if section_number.nil? || subsection_number.nil?
      "#{section_number}.#{subsection_number}"
    end

    def to_s
      return @title if number.nil?
      "#{number}. #{@title}"
    end
  end

  class TableOfContents < Views::Base
    attr_accessor :section

    SECTIONS = {
      table_of_contents: [Section.new(:table_of_contents, title: "number theory for programmers")],
      prologue: [Section.new(:prologue)],
      division: [
        Section.new(:divisibility),
        Section.new(:division_with_remainder),
        Section.new(:remainders_in_programming),
        Section.new(:divisors),
        Section.new(:common_divisors),
        Section.new(:greatest_common_divisor),
      ],
      appendix: [
        Section.new(:peano_axioms),
        Section.new(:mathematical_induction),
        Section.new(:well_ordering_principle),
      ],
    }

    def initialize(params)
      super
      assign_breadcrumbs!
      assign_section_numbers!
      @section = SECTIONS[:table_of_contents]
    end

    def sections
      SECTIONS
    end

    def section_lookup
      @section_lookup ||= sections.values.flatten.reduce({}) do |hash, section|
        {**hash, section.id => section}
      end
    end

    def section_for(section_id)
      section_lookup[section_id]
    end

    def title_for(section_id)
      section_for(section_id)&.to_s
    end

    def url_for(section_id)
      section_for(section_id)&.url
    end

    def main_sections
      sections.reject do |section_id, _|
        [:table_of_contents, :prologue, :appendix].include?(section_id)
      end
    end

    def assign_breadcrumbs!
      [nil, *sections.values.drop(1).flatten].each_cons(2) do |prev_section, curr_section|
        prev_section.next_section = curr_section unless prev_section.nil?
        curr_section.prev_section = prev_section
      end
    end

    def assign_section_numbers!
      main_sections.values.each_with_index do |subsections, section_index|
        subsections.each_with_index do |subsection, subsection_index|
          subsection.section_number = section_index + 1
          subsection.subsection_number = subsection_index + 1
        end
      end
      sections[:appendix].each_with_index do |subsection, subsection_index|
        subsection.section_number = "a"
        subsection.subsection_number = subsection_index + 1
      end
    end

    def next_section
      @section.next_section
    end

    def prev_section
      @section.prev_section
    end

    def breadcrumbs
      [
        {
          url: prev_section&.url,
          show: !prev_section.nil?,
          title: [
            "\u2190",
            prev_section&.number,
          ].join(" "),
        },
        {
          url: "/number_theory",
          show: true,
          title: "contents",
        },
        {
          url: next_section&.url,
          show: !next_section.nil?,
          title: [
            next_section&.number,
            "\u2192",
          ].join(" "),
        },
      ]
    end

    def route
      @section.id
    end

    def section_title
      @section.to_s
    end
  end
end
