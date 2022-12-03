require '../book'
require '../rental'
require '../teacher'

describe Rental do
  it 'creates a new instance of the Rental class' do
    book = Book.new('Lord of the Rings', 'J. R. R. Tolkin')
    teacher = Teacher.new(35, 'Eva', true, 'Mathematics')
    rental = Rental.new('2022-12-03', book, teacher)
    expect(rental).to be_an_instance_of Rental
  end

  it 'creates a new instance of the Rental class with a date' do
    book = Book.new('Lord of the Rings', 'J. R. R. Tolkin')
    teacher = Teacher.new(35, 'Eva', true, 'Mathematics')
    rental = Rental.new('2022-12-03', book, teacher)
    expect(rental.date).to eq('2022-12-03')
  end

  it 'creates a new instance of the Rental class with a person' do
    book = Book.new('Lord of the Rings', 'J. R. R. Tolkin')
    teacher = Teacher.new(35, 'Eva', true, 'Mathematics')
    rental = Rental.new('2022-12-03', book, teacher)
    expect(rental.person).to eq(teacher)
  end

  it 'creates a new instance of the Rental class with a book' do
    book = Book.new('Lord of the Rings', 'J. R. R. Tolkin')
    teacher = Teacher.new(35, 'Eva', true, 'Mathematics')
    rental = Rental.new('2022-12-03', book, teacher)
    expect(rental.book).to eq(book)
  end
end
