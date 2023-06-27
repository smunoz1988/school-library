require_relative 'book'
require 'json'

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

  def load_books
    # load from file books.json
    if File.exist?('books.json')
      books_data = JSON.parse(File.read('books.json'))
      books_data.each do |book_data|
        book = Book.new(book_data['title'], book_data['author'])
        @books.push(book)
      end
    end
  end

  def save_books
    books_data = []
    @books.each do |book|
      books_data.push(
        title: book.title,
        author: book.author,
        rentals: book.rentals
      )
    end
    # save to file books.json
    File.open('books.json', 'w') do |f|
      f.write(books_data.to_json)
    end
  end
end
