  require './person' # consider using require_relative instead

class Teacher < Person
  attr_reader :specialization
  
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
