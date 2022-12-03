require '../book'
require '../rental'
require '../teacher'

describe Teacher do
  it 'creates a new instance of the Teacher class' do
    teacher = Teacher.new(35, 'Eva', true, 'Biology')
    expect(teacher).to be_an_instance_of Teacher
  end

  it 'creates a new instance of the Teacher class with a name' do
    teacher = Teacher.new(35, 'Eva', true, 'Biology')
    expect(teacher.name).to eq('Eva')
  end

  it 'creates a new instance of the Teacher class with an age' do
    teacher = Teacher.new(35, 'Eva', true, 'Biology')
    expect(teacher.age).to eq(35)
  end

  it 'adds a rentals object to the array' do
    teacher = Teacher.new(35, 'Eva', true, 'Biology')
    book = Book.new('The Count of Monte-Cristo', 'Alexandre Dumas')
    Rental.new('2022-12-3', book, teacher)
    expect(teacher.rentals.length).to eq(1)
  end
end
