require_relative 'rental'
require_relative 'person_option'
require_relative 'book_option'

class RentalOption
  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}", "Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Id of the person:'
    person_id = gets.chomp.to_i
    if @rentals.empty?
      puts 'No rentals asign to that id'
    else
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts 'List of rentals:'
          puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end
