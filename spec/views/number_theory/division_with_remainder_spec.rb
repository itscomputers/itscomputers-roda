require_relative "../../spec_helper"

describe Views::NumberTheory::DivisionWithRemainder do
  describe "#div_rem" do
    subject { Ebe::Naive.div_rem(a, b) }

    Views::NumberTheory::DivisionWithRemainder::EXAMPLES.each do |hash|
      context "when dividing #{hash[:dividend]} by #{hash[:divisor]}" do
        let(:a) { hash[:dividend] }
        let(:b) { hash[:divisor] }

        it { is_expected.to eq hash.slice(:quotient, :remainder).values }
        it { is_expected.to eq Ebe.div_rem(a, b) }
      end
    end
  end
end
