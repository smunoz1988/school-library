require './teacher'

describe Teacher do
    let(:teacher) { Teacher.new(34, 'Math', 'Jose') }

    describe '#new' do
        it 'creates a new teacher' do
            expect(teacher).to be_an_instance_of(Teacher)
        end
    end
end