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

    def create_person
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
        person_type = gets.chomp.to_i
        case person_type
        when 1
            create_student #Need to create the method
        when 2
            create_teacher #Need to create the method
        else
            puts 'Invalid option'
        end
         # here will call the main menu
    end

    def create_student
        puts 'Age:'
        age = gets.chomp.to_i
        puts 'Name:'
        name = gets.chomp
        puts "Has parent permission? [Y/N]:"
        parent_permission = gets.chomp.upcase == 'Y'
        @people.push(Student.new(age, name, parent_permission))
        puts "Person #{name} was created with ID #{id}"
    end
end
