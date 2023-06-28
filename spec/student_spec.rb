require './student'
require './classroom'

describe Student do
  before do
    @student = Student.new(10, "Mike")
  end

  describe "#new" do
    it "takes two parameters and returns a Student object" do
      expect(@student).to be_an_instance_of(Student)
    end
  end

  describe "#age" do
    it "returns the correct age" do
      expect(@student.age).to eql(10)
    end
  end

  describe "#play_hooky" do
    it "returns the correct play_hooky" do
      expect(@student.play_hooky).to eql("¯(ツ)/¯")
    end
  end
end
