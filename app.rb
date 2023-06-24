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

    def create_teacher
        puts 'Age:'
        age = gets.chomp.to_i
        puts 'Name:'
        name = gets.chomp
        puts 'Specialization:'
        specialization = gets.chomp
        @people.push(Teacher.new(age, specialization, name))
        puts "Person #{name} was created with ID #{id}"
    end

    def create_book
        puts 'Title:'
        title = gets.chomp
        puts 'Author:'
        author = gets.chomp
        @books.push(Book.new(title, author))
        puts "Book #{title} was created"
        # here will call the main menu
    end

    def create_rental
        puts 'Select a book from the following list by number'
        @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
        book_index = gets.chomp.to_i
        puts 'Select a person from the following list by number (not ID)'
        @people.each_with_index { |person, index| puts "#{index} [#{person.class} Name: #{person.name}, ID: #{person.id}", "Age: #{person.age}]" }
        person_index = gets.chomp.to_i
        person_index = @people[person_index].id
        puts 'Date:'
        date = gets.chomp
        @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
        puts 'Rental created successfully'
        # here will call the main menu
    end

    def list_rentals
        puts 'Id of the person:'
        person_id = gets.chomp.to_i
        if @rentals.empty?
            puts 'No rentals asign to that id'
        else
            puts 'List of rentals:'
            @rentals.each { |rental| puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
        end
        # here will call the main menu
    end

    def quit
        puts 'Good bye!'
    end
end
