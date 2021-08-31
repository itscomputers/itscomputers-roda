require_relative '../../../lib/ebe/naive'

describe Ebe::Naive do
  describe "#divides?" do
    EXAMPLES = [
      { :dividend => 45, :divisor => 15, :result => true },
      { :dividend => -45, :divisor => 15, :result => true },
      { :dividend => 45, :divisor => -15, :result => true },
      { :dividend => -45, :divisor => - 15, :result => true },
      { :dividend => 45, :divisor => 10, :result => false },
      { :dividend => -45, :divisor => 10, :result => false },
      { :dividend => 45, :divisor => -10, :result => false },
      { :dividend => -45, :divisor => - 10, :result => false },
      { :dividend => 0, :divisor => 7, :result => true },
      { :dividend => 7, :divisor => 7, :result => true },
      { :dividend => -7, :divisor => 7, :result => true },
      { :dividend => 7, :divisor => 1, :result => true },
      { :dividend => 7, :divisor => -1, :result => true },
      { :dividend => 7, :divisor => 0, :result => false },
    ]

    EXAMPLES.each do |hash|
      context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
        it "is #{hash[:result]}" do
          expect(described_class.divides?(hash[:divisor], hash[:dividend])).to be hash[:result]
        end
      end
    end
  end
end

