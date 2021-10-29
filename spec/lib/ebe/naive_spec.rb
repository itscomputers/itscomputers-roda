require_relative '../../spec_helper'

describe Ebe::Naive do
  describe "#divides?" do
    Views::Ebe::Divisibility::EXAMPLES.each do |hash|
      context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
        it "is #{hash[:divides?]}" do
          expect(described_class.divides?(hash[:divisor], hash[:dividend])).to be hash[:divides?]
        end
      end
    end
  end
end

