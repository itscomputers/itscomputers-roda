require_relative "../../spec_helper"

describe Ebe::Division do
  def any(except: nil, lower_bound: -10**8, upper_bound: 10**8)
    number = Random.rand(lower_bound..upper_bound)
    return number if except.nil?
    return number unless [except].flatten.include? number
    any(except: except)
  end

  def positive(except: nil)
    any(except: except, lower_bound: 1)
  end

  def negative(except: nil)
    any(except: except, upper_bound: -1)
  end

  describe "#divides" do
    subject { Ebe.divides(b, a) }

    let(:b) { any(except: [0, 1, -1]) }

    context "when `a` is a multiple of `b`" do
      let(:a) { any * b }

      it { is_expected.to be true }
    end

    context "when `a` is not a multiple of `b`" do
      let(:a) { any * b + Random.rand(0...b.abs) }

      it { is_expected.to be false }
    end

    context "when `b == 0`" do
      let(:b) { 0 }
      let(:a) { any }

      it { is_expected.to be false }
    end

    context "when `b != 0` and `a == 0`" do
      let(:b) { any(except: 0) }
      let(:a) { 0 }

      it { is_expected.to be true }
    end

    context "when `b == 1`" do
      let(:b) { 1 }
      let(:a) { any }

      it { is_expected.to be true }
    end

    context "when `b == -1`" do
      let(:b) { -1 }
      let(:a) { any }

      it { is_expected.to be true }
    end
  end

  describe "#divisors" do
    let(:divisors) { Ebe.divisors(integer) }
    let(:integer) { any lower_bound: 1, upper_bound: 1000 }
    let(:non_divisors) { (1..integer).to_a - divisors }

    it "consists of divisors" do
      expect(divisors.all? { |divisor| Ebe.divides(divisor, integer) }).to be true
    end

    it "leaves out non_divisors" do
      expect(non_divisors.none? { |non_divisor| Ebe.divides(non_divisor, integer) }).to be true
    end
  end

  describe "#div_rem" do
    context "when `divisor == 0`" do
      it { expect { Ebe.div_rem(any, 0) }.to raise_exception ZeroDivisionError }
    end

    ["zero", "positive", "negative"].product(["positive", "negative"]).each do |a, b|
      context "when dividend is #{a} and divisor is #{b}" do
        let(:div_rem) { Ebe.div_rem(dividend, divisor) }

        let(:quotient) { div_rem.first }
        let(:remainder) { div_rem.last }

        let(:dividend) {
          case a
          when "zero" then 0
          when "positive" then positive
          when "negative" then negative
          end
        }
        let(:divisor) {
          case b
          when "positive" then positive
          when "negative" then negative
          end
        }

        it "has a nonnegative remainder" do
          expect(remainder).to be >= 0
        end

        it "has a remainder less than the absolute value of the divisor" do
          expect(remainder).to be < divisor.abs
        end

        it "satisfies the linear equation" do
          expect(dividend).to eq divisor * quotient + remainder
        end
      end
    end
  end
end
