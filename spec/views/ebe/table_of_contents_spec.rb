require_relative "../../spec_helper"

describe Views::Ebe::TableOfContents do
  let(:contents) { described_class.new }

  describe "#section_numbers" do
    subject { contents.section_numbers }

    let(:section_lookup) { {
      :one => { :section => true },
      :one_one => {},
      :one_two => {},
      :two => { :section => true },
      :two_one => {},
      :three => { :section => true },
    } }

    let(:expected_section_numbers) { {
        :one => "1",
        :one_one => "1.1",
        :one_two => "1.2",
        :two => "2",
        :two_one => "2.1",
        :three => "3",
    } }

    before { allow(contents).to receive(:section_lookup).and_return section_lookup }

    it { is_expected.to eq expected_section_numbers }
  end
end

