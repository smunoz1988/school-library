require './capitalize_decorator'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name' do
      nameable = double('Nameable', correct_name: 'john')
      capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(capitalize_decorator.correct_name).to eq('John')
    end
  end
end
