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

    context "when `b` is not 0, 1, or -1" do
      let(:b) { any(except: [0, 1, -1]) }

      context "when `a` is a multiple of `b`" do
        let(:a) { any * b }
        it { is_expected.to be true }
      end

      context "when `a` is not a multiple of `b`" do
        let(:a) { any * b + Random.rand(0...b.abs) }
        it { is_expected.to be false }
      end
    end

    describe "explicit examples" do
      Views::Ebe::Divisibility::EXAMPLES.each do |hash|
        context "when dividing #{hash[:divisor]} into #{hash[:dividend]}" do
          let(:a) { hash[:dividend] }
          let(:b) { hash[:divisor] }
          it { is_expected.to eq hash[:divides?] }
        end
      end
    end
  end

  describe "#divisors" do
    subject { Ebe.divisors(integer) }

    Views::Ebe::Divisors::EXAMPLES.each do |hash|
      context "when integer is #{hash[:integer]}" do
        let(:integer) { hash[:integer] }
        it { is_expected.to eq hash[:divisors] }
      end
    end

    context "general behavior" do
      let(:integer) { any lower_bound: 1, upper_bound: 1000 }
      let(:non_divisors) { (1..integer).to_a - subject }

      it "consists of divisors" do
        expect(subject.all? { |divisor| Ebe.divides(divisor, integer) }).to be true
      end

      it "leaves out non_divisors" do
        expect(non_divisors.none? { |non_divisor| Ebe.divides(non_divisor, integer) }).to be true
      end
    end
  end

  describe "div_rem" do
    subject { Ebe.div_rem(dividend, divisor) }

    let(:quotient) { subject.first }
    let(:remainder) { subject.last }

    shared_examples "satisfies division algorithm properties" do
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

    context "when `divisor == 0`" do
      let(:dividend) { any }
      let(:divisor) { 0 }
      it { expect { subject }.to raise_exception ZeroDivisionError }
    end

    context "when `dividend == 0`" do
      let(:dividend) { 0 }

      context "when divisor is positive" do
        let(:divisor) { positive }
        it_behaves_like "satisfies division algorithm properties"
      end

      context "when divisor is negative" do
        let(:divisor) { negative }
        it_behaves_like "satisfies division algorithm properties"
      end
    end

    context "when dividend is positive" do
      let(:dividend) { positive }

      context "when divisor is positive" do
        let(:divisor) { positive }
        it_behaves_like "satisfies division algorithm properties"
      end

      context "when divisor is negative" do
        let(:divisor) { negative }
        it_behaves_like "satisfies division algorithm properties"
      end
    end

    context "when dividend is negative" do
      let(:dividend) { negative }

      context "when divisor is positive" do
        let(:divisor) { positive }
        it_behaves_like "satisfies division algorithm properties"
      end

      context "when divisor is negative" do
        let(:divisor) { negative }
        it_behaves_like "satisfies division algorithm properties"
      end
    end
  end
end
