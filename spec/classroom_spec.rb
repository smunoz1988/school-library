require './classroom'

describe ClassRoom do
  before do
    @classroom = ClassRoom.new('Classroom 1')
  end

  describe '#new' do
    it 'takes parameters and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of(ClassRoom)
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq('Classroom 1')
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom = ClassRoom.new('Math')
      student = double('student')
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
