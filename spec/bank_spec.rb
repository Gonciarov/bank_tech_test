require 'bank.rb'

describe Bank do
    describe "#greet" do
      it "shows a menu" do
        expect(subject.greet).to eq("Welcome, Customer!")
      end
    end
    describe "#process" do
      it "calls the system for action" do
        expect(subject).to receive(:process)
        subject.process('x')
      end
      it 'closes the program if input is x' do
        expect(subject.process('x')).to eq("come again when you ready!")
      end

    end
    describe '#try_again' do
      it 'asks to enter another value' do
        expect(subject.try_again).to eq("No idea what you meant, try again: ")
        end
      end
  end
