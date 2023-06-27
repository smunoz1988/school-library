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

  def load_data
    @book_options.load_books
    @person_option.load_people
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
    @rentals_list.list_rentals
    @main_call.display_menu
  end

  def quit
    @book_options.save_books
    @person_option.save_people
    puts 'Thank you for using this app!'
  end
end
