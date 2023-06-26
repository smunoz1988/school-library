require './book_option'
require './rental'
require './person_option'

class App
  def initialize(main_call)
    @main_call = main_call
    @person_option = PersonOption.new
    @book_options = BookOption.new
    @rentals_list = []
  end

  def list_books
    @book_options.list_books
    @main_call.display_menu
  end

  def list_people
    @person_option.list_people
    @main_call.display_menu
  end

  def create_person
    @person_option.create_person
    @main_call.display_menu
  end

  def create_book
    @book_options.create_book
    @main_call.display_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book_options.books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @person_option.people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}", "Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @book_options.books[book_index], @person_option.people[person_index]))
    puts 'Rental created successfully'
    @main_call.display_menu
  end

  def list_rentals
    puts 'Id of the person:'
    person_id = gets.chomp.to_i
    if @rentals_list.empty?
      puts 'No rentals asign to that id'
    else
      @rentals_list.each do |rental|
        if rental.person.id == person_id
          puts 'List of rentals:'
          puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
    @main_call.display_menu
  end

  def quit
    puts 'Thank you for using this app!'
  end
end
