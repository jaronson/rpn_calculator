require 'spec_helper'

RSpec.describe Calculator do
  context 'given a number as input' do
    it 'pushes the value onto the stack' do
      subject.handle_input(10)
      subject.handle_input(57.45)
      expect(subject.stack).to eq([10, 57.45])
    end
  end

  context 'given a string integer as input' do
    it 'pushes the integer value onto the stack' do
      subject.handle_input('10')
      subject.handle_input('98')
      expect(subject.stack).to eq([10, 98])
    end
  end

  context 'given a string float as input' do
    it 'pushes the float value onto the stack' do
      subject.handle_input('10.5')
      expect(subject.stack).to eq([10.5])
    end
  end

  context 'operator input' do
    it 'returns the result of the addition operator' do
      subject.handle_input('10')
      subject.handle_input('99')
      result = subject.handle_input('+')
      expect(result).to eq([109])
    end

    it 'returns the result of the subtraction operator' do
      subject.handle_input('10')
      subject.handle_input('99')
      result = subject.handle_input('-')
      expect(result).to eq([-89])
    end

    it 'returns the result of the multiplication operator' do
      subject.handle_input('10')
      subject.handle_input('99')
      result = subject.handle_input('*')
      expect(result).to eq([990])
    end

    it 'returns the result of the division operator' do
      subject.handle_input('100')
      subject.handle_input('10')
      result = subject.handle_input('/')
      expect(result).to eq([10])
    end
  end

  context 'given "state" as input' do
    it 'pushes the state of the stack onto the output' do
      subject.handle_input('100')
      result = subject.handle_input('state')
      expect(result).to eq(['[100]'])
    end
  end

  context 'given any other input' do
    it 'raises an UnrecognizedInputError' do
      expect do
        subject.handle_input('anything')
      end.to raise_error(Calculator::UnrecognizedInputError)
    end
  end

  context 'given multiple, space-separated inputs' do
    it 'pushes the values onto the stack and runs the given operations' do
      result = subject.handle_input('100 10 /')
      expect(result).to eq([10])

      result = subject.handle_input('100 10 / 9 9 9 *')
      expect(result).to eq([10, 729])
    end
  end
end
