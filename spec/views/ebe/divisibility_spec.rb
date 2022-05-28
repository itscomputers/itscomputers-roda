require_relative "../../spec_helper"


describe Views::Ebe::Divisibility do
  describe "#divides" do
    subject { Ebe::Naive.divides(b, a) }

    Views::Ebe::Divisibility::EXAMPLES.each do |hash|
      context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
        let(:a) { hash[:dividend] }
        let(:b) { hash[:divisor] }
        it { is_expected.to eq hash[:divides?] }
        it { is_expected.to eq Ebe.divides(b, a) }
      end
    end
  end
end

