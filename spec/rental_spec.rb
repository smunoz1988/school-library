require './rental'
require './person'
require './book'

describe Rental do
  let (:book) { Book.new('Fantastic Mr Fox', 'Roald Dahl') }
  let(:person) { Person.new('jose', 18) }
  let(:rental) { Rental.new('2020-01-01', book, person) }

  describe '#new' do
    it 'creates a new rental' do
      expect(rental).to be_an_instance_of(Rental)
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      expect(rental.date).to eq('2020-01-01')
    end
  end

  describe '#person' do
    it 'returns the correct person' do
      expect(rental.person).to eq(person)
    end
  end
end
