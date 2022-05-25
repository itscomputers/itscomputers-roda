require_relative "../../spec_helper"

describe Ebe::Naive do
  describe "#divides" do
    subject { described_class.divides(b, a) }

    Views::Ebe::Divisibility::EXAMPLES.each do |hash|
      context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
        let(:a) { hash[:dividend] }
        let(:b) { hash[:divisor] }
        it { is_expected.to eq hash[:divides?] }
      end
    end
  end

  describe "#div_rem" do
    subject { described_class.div_rem(a, b) }

    Views::Ebe::DivisionWithRemainder::DIV_REM_EXAMPLES.each do |hash|
      context "when dividing #{hash[:dividend]} by #{hash[:divisor]}" do
        let(:a) { hash[:dividend] }
        let(:b) { hash[:divisor] }
        it { is_expected.to eq [hash[:quotient], hash[:remainder]] }
      end
    end

    context "division by zero" do
      let(:a) { 99 }
      let(:b) { 0 }
      it { expect { subject }.to raise_exception(ZeroDivisionError) }
    end
  end
end
