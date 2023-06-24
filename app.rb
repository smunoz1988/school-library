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

    def list_people
        if @people.empty?
            puts 'No people available'
        else
            puts 'List of people:'
            @people.each { |person| puts "[#{person.class} Name: #{person.name}, ID: #{person.id}", "Age: #{person.age}]" }
        end
        # here will call the main menu
    end
end
