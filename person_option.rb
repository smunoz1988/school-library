require './student'
require './teacher'
require 'json'

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

  def load_people
    # load from file people.json
    if File.exist?('people.json')
      people_data = JSON.parse(File.read('people.json'))
      people_data.each do |person_data|
        if person_data['class'] == 'Student'
          person = Student.new(person_data['age'], person_data['name'])
          person.id = person_data['id']
          @people.push(person)
        elsif person_data['class'] == 'Teacher'
          person = Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
          person.id = person_data['id']
          person.rentals = person_data['rentals']
          @people.push(person)
        end
      end
    end
  end

  def save_people
    people_data = []
    @people.each do |person|
      if person.class == Student
        people_data.push(
          class: 'Student',
          age: person.age,
          name: person.name,
          id: person.id,
          rentals: person.rentals
        )
      elsif person.class == Teacher
        people_data.push(
          class: 'Teacher',
          age: person.age,
          name: person.name,
          specialization: person.specialization,
          id: person.id,
          rentals: person.rentals
        )
      end
    end
    # save to file people.json
    File.open('people.json', 'w') do |f|
      f.write(people_data.to_json)
    end
  end
end
