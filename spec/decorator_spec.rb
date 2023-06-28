require './decorator'

describe Decorator do
  before do
    @decorator = Decorator.new(double('Nameable'))
  end

  describe '#new' do
    it 'takes one parameter and returns a Decorator object' do
      expect(@decorator).to be_an_instance_of(Decorator)
    end
  end

  describe '#correct_name' do
    it 'capitalizes the name' do
      nameable = double('Nameable', correct_name: 'john')
      capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(capitalize_decorator.correct_name).to eq('John')
    end
  end
end
