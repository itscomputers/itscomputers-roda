require_relative "../../spec_helper"

describe Ebe::Naive do
  describe "#divides?" do
    subject { described_class.divides(b, a) }

    Views::Ebe::Divisibility::EXAMPLES.each do |hash|
      context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
        let(:a) { hash[:dividend] }
        let(:b) { hash[:divisor] }
        it { is_expected.to eq hash[:divides?] }
      end
    end
  end
end
