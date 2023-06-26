require_relative 'book'

class BookOption
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_books
    if @books.empty?
      puts 'No books available'
    else
      puts 'List of books:'
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "Book #{title} was created"
  end
end
