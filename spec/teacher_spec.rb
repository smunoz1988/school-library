require './teacher'

describe Teacher do
    let(:teacher) { Teacher.new(34, 'Math', 'Jose') }

    describe '#new' do
        it 'creates a new teacher' do
            expect(teacher).to be_an_instance_of(Teacher)
        end
    end

    describe '#name' do
        it 'returns the correct name' do
            expect(teacher.name).to eq('Jose')
        end
    end
end