module Views::Ebe
  class TableOfContents < Views::Base
    attr_accessor :section

    SECTION_DETAILS = {
      divisibility: {section: true}
      # :bezout_identity => { :title => "bezout's identity" },
      # :primality => { :section => true },
    }

    SECTIONS = [
      :divisibility,
      :divisors
      # :common_divisors,
      # :greatest_common_divisor,
      # :linear_combinations,
      # :bezout_identity,
      # :common_multiples,
      # :least_common_multiple,
      # :linear_equations,
      # :primality,
    ]

    def initialize(params)
      super
      @section = :table_of_contents
    end

    def next_section
      next_section_lookup.dig @section
    end

    def next_section_details
      {
        url: "/ebe/#{next_section}",
        title: [
          section_numbers.dig(next_section),
          " - ",
          title_lookup.dig(next_section),
          "\u2192"
        ].join(" ")
      }
    end

    def prev_section
      prev_section_lookup.dig @section
    end

    def prev_section_details
      {
        url: "/ebe/#{prev_section}",
        title: [
          "\u2190",
          section_numbers.dig(prev_section),
          " - ",
          title_lookup.dig(prev_section)
        ].join(" ")
      }
    end

    def route
      @section.to_s
    end

    def section_title
      [
        section_numbers.dig(@section),
        title_lookup.dig(@section)
      ].join(". ")
    end

    def sections
      SECTIONS
    end

    def section_details
      SECTION_DETAILS
    end

    def section_numbers
      return @numbered_sections unless @numbered_sections.nil?

      section_number = 0
      subsection_number = 0

      @numbered_sections = sections.inject({}) do |hash, section|
        if section_details.dig(section, :section)
          section_number += 1
          subsection_number = 0
          section_string = section_number.to_s
        else
          subsection_number += 1
          section_string = "#{section_number}.#{subsection_number}"
        end

        {**hash, section => section_string}
      end
    end

    def next_section_lookup
      @next_section_lookup ||= {
        **sections.each_cons(2).to_h,
        sections.last => nil
      }
    end

    def prev_section_lookup
      @prev_section_lookup ||= {
        sections.first => nil,
        **sections.each_cons(2).map(&:reverse).to_h
      }
    end

    def title_lookup
      @title_lookup ||= sections.inject({}) do |hash, section|
        {
          **hash,
          section => section_details.dig(section, :title) || section.to_s.tr("_", " ")
        }
      end
    end
  end
end
