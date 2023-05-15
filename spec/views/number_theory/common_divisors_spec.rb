require_relative "../../spec_helper"

describe Views::NumberTheory::CommonDivisors do
  describe "#common_divisors" do
    subject { Ebe.common_divisors(*inputs) }

    Views::NumberTheory::CommonDivisors::EXAMPLES.each do |hash|
      context "when computing common divisors of #{hash[:inputs].join(", ")}" do
        let(:inputs) { hash[:inputs] }

        it { is_expected.to eq hash[:common_divisors] }
      end
    end
  end
end

