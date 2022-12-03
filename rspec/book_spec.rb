require '../book'
require '../student'
require '../teacher'
require '../rental'

describe Book do
  it 'creates a new instance of the Book class' do
    book = Book.new('Dune', 'Frank Herbert')
    expect(book).to be_an_instance_of Book
  end

  it 'adds a rental to book rentals' do
    person = Teacher.new(35, 'Eva-Lavinia', true, 'IT')
    book = Book.new('Fear is the key', 'Alistair MacLean')
    Rental.new('2022-12-3', book, person)

    expect(book.rentals.length).to eq(1)
  end

  it 'adds a rental to person rentals' do
    person = Teacher.new(35, 'Eva-Lavinia', true, 'IT')
    book = Book.new('Fear is the key', 'Alistair MacLean')
    Rental.new('2022-12-3', book, person)

    expect(person.rentals.length).to eq(1)
  end
end
