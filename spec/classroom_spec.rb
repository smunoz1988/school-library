require './classroom'

describe ClassRoom do
    before do
        @classroom = ClassRoom.new('Classroom 1')
    end

    describe "#new" do
        it "takes parameters and returns a Classroom object" do
            expect(@classroom).to be_an_instance_of(ClassRoom)
        end
    end
end