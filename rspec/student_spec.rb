require '../book'
require '../rental'
require '../student'

describe Student do
  it 'creates a new instance of the Student class' do
    student = Student.new(19, 'Tommy', false, 'Psychology')
    expect(student).to be_an_instance_of Student
  end

  it 'creates a new instance of the Student class with a name' do
    student = Student.new(19, 'Tommy', false, 'Philosophy')
    expect(student.name).to eq('Tommy')
  end

  it 'creates a new instance of the Student class with an age' do
    student = Student.new(19, 'Tommy', false, 'Sociology')
    expect(student.age).to eq(19)
  end

  it 'adds a rentals object to the array' do
    student = Student.new(19, 'Tommy', false, 'Geology')
    book = Book.new('The Empire', 'Isaac Asimov')
    Rental.new('2022-12-3', book, student)
    expect(student.rentals.length).to eq(1)
  end
end
