require_relative 'book_option'
require_relative 'rental_option'
require_relative 'person_option'

class App
  def initialize(main_call)
    @main_call = main_call
    @person_option = PersonOption.new
    @book_options = BookOption.new
    @rentals_list = RentalOption.new(@book_options.books, @person_option.people)
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
    @rentals_list.create_rental
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
