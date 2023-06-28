require './person'

describe Person do
  let(:person) { Person.new(18, 'jose', parent_permission: true) }

  describe '#new' do
    it 'creates a new person' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(person.name).to eq('jose')
    end
  end

  describe '#of_age?' do
    context 'when age is 18 or above' do
      it 'returns true' do
        expect(person.of_age?).to be(true)
      end
    end

    context 'when age is below 18' do
      let(:person) { Person.new(16, 'jose', parent_permission: true) }

      it 'returns false' do
        expect(person.of_age?).to be(false)
      end
    end
  end


  describe '#can_use_services?' do
    context 'when age is 18 or above' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when age is below 18' do
      let(:person) { Person.new(16, 'jose', parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('jose')
    end
  end
end
