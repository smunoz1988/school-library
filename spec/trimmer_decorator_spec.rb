require './decorator'
require './trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct trimmed name' do
      allow(nameable).to receive(:correct_name).and_return('maximiliano')
      expect(decorator.correct_name).to eq('maximilian')
    end

    it 'returns the full name if it is less than or equal to 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('john')
      expect(decorator.correct_name).to eq('john')
    end
  end
end
