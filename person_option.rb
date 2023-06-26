require './student'
require './teacher'

class PersonOption
    attr_accessor :people
    def initialize
        @people = []
    end

    def list_people
        if @people.empty?
          puts 'No people available'
        else
          puts 'List of people:'
          @people.each do |person|
            puts "[#{person.class} Name: #{person.name}, ID: #{person.id}", "Age: #{person.age}]"
          end
        end
    end

    def create_person
        puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
        person_type = gets.chomp.to_i
        case person_type
        when 1
          create_student
        when 2
          create_teacher
        else
          puts 'Invalid option'
        end
    end

    def create_student
        puts 'Age:'
        age = gets.chomp.to_i
        puts 'Name:'
        name = gets.chomp
        puts 'Has parent permission? [Y/N]:'
        parent_permission = gets.chomp.upcase == 'Y'
        @people.push(Student.new(age, name, parent_permission: parent_permission))
        puts
        puts "Person #{name} was created"
      end
    
      def create_teacher
        puts 'Age:'
        age = gets.chomp.to_i
        puts 'Name:'
        name = gets.chomp
        puts 'Specialization:'
        specialization = gets.chomp
        @people.push(Teacher.new(age, specialization, name))
        puts
        puts "Person #{name} was created"
      end
end