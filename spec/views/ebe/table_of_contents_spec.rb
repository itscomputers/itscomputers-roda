require_relative "../../spec_helper"

describe Views::Ebe::TableOfContents do
  let(:contents) { described_class.new({}) }

  describe "#section_numbers" do
    subject { contents.section_numbers }

    let(:section_details) {
      {
        one: {section: true},
        two: {section: true},
        three: {section: true}
      }
    }

    let(:sections) {
      [
        :one,
        :one_one,
        :one_two,
        :two,
        :two_one,
        :three
      ]
    }

    let(:expected_section_numbers) {
      {
        one: "1",
        one_one: "1.1",
        one_two: "1.2",
        two: "2",
        two_one: "2.1",
        three: "3"
      }
    }

    before do
      allow(contents).to receive(:section_details).and_return section_details
      allow(contents).to receive(:sections).and_return sections
    end

    it { is_expected.to eq expected_section_numbers }
  end
end
