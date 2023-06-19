require './person'

class Teacher < Person
    def initialize(age, specialization, name = 'Unknown', _parent_permission: true)
        super(age, name, _parent_permission: true)
        @specialization = specialization
    end
end