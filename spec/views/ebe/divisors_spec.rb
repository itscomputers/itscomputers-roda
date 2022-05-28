require_relative "../../spec_helper"

describe Views::Ebe::Divisors do
  describe "#divisors" do
    subject { Ebe.divisors(integer) }

    Views::Ebe::Divisors::EXAMPLES.each do |hash|
      context "divisors of #{hash[:integer]}" do
        let(:integer) { hash[:integer] }

        it { is_expected.to eq hash[:divisors] }
      end
    end
  end
end
