require './student'

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
            @student.age.should eql 10
        end
    end
end