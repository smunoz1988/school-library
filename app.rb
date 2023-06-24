require './person'
require './book'
require './rental'
require './student'
require './teacher'

class App
    def initialize(mainCall)
        @mainCall = mainCall
        @people = []
        @books = []
        @rentals = []
    end

    def list_books
        if @books.empty?
            puts 'No books available'
        else
            puts 'List of books:'
            @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
        end
        # here will call the main menu
end
