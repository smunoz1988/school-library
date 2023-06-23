require './person'

class Student < Person
  attr_accessor :classroom #  considering attr?reader

  def initialize(name, age, classroom: nil, _parent_permission: true)
    super(age, name, _parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom_student=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
