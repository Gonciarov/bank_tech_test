# frozen_string_literal: true

require 'menu.rb'

describe Menu do
  describe '#greet' do
    it 'says hi' do
      expect(subject.greet).to eq('Welcome, Customer!')
    end
  end

  describe '#show_options' do
    it 'shows options' do
      expect(subject.show_options).to eq('Enter number to operate (1 - deposit, 2 - withdraw, 3 - balance and history, x - exit): ')
    end
  end

  describe '#select' do
    it 'calls for process' do
      expect_any_instance_of(Menu).to receive(:process)
      subject.select
    end
  end
  describe '#process' do
    it 'calls the system for action' do
      expect(subject).to receive(:process)
      subject.process('x')
    end
    it 'calls withdraw method on account' do
      expect(subject).to receive(:process).with('2')
      subject.process('2')
    end

    it 'calls deposit method on account' do
      expect(subject).to receive(:process).with('1')
      subject.process('1')
    end

    it 'calls for statement display' do
      expect(subject).to receive(:process).with('3')
      subject.process('3')
    end

    it 'closes the program if input is x' do
      expect(subject.process('x')).to eq('come again when you ready!')
    end

    it 'asks to try again' do
      expect_any_instance_of(Menu).to receive(:try_again)
      subject.process('sd')
    end
  end
  describe '#try_again' do
    it 'asks to enter another value' do
      expect(subject.try_again).to eq('No idea what you meant, try again: ')
    end
  end
end
