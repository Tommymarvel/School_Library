require '../student'
require '../classroom'

describe Classroom do
  it 'creates a new instance of the Classroom class' do
    classroom = Classroom.new('Biology')
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'creates a new instance of the Classroom class with an age' do
    classroom = Classroom.new('Chemistry')
    expect(classroom.label).to eq('Chemistry')
  end

  it 'adds a student object to the array' do
    student = Student.new(19, 'Tommy', true, 'Physics')
    classroom = Classroom.new('Physics')
    
    classroom.add_student(student)
    expect(classroom.student.length).to eq(1)
  end
end
