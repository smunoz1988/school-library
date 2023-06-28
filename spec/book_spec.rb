require './book'

describe Book do
  before do
    @book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'The Lord of the Rings'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'J. R. R. Tolkien'
    end
  end
end
