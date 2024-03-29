require_relative "../../spec_helper"

describe Views::NumberTheory::Divisors do
  describe "#divisors" do
    subject { Ebe.divisors(integer) }

    Views::NumberTheory::Divisors::EXAMPLES.each do |hash|
      context "when computing divisors of #{hash[:integer]}" do
        let(:integer) { hash[:integer] }

        it { is_expected.to eq hash[:divisors] }
      end
    end
  end
end
