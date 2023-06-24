require './person' # consider using require_relative instead

class Student < Person
  attr_reader :classroom

  def initialize(age, name = "Unknown", parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom_student=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
