require '../book'
require '../rental'
require '../person'

describe Person do
  it 'creates a new instance of the Person class' do
    person = Person.new(35, 'Eva', true)
    expect(person).to be_an_instance_of Person
  end

  it 'creates a new instance of the Person class with a name' do
    person = Person.new(35, 'Eva', true)
    expect(person.name).to eq('Eva')
  end

  it 'creates a new instance of the Person class with an age' do
    person = Person.new(35, 'Eva', true)
    expect(person.age).to eq(35)
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(35, 'Eva', false)
    expect(person.can_use_service?).to eq(true)
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(35, 'Eva', true)
    expect(person.correct_name).to eq('Eva')
  end

  it 'adds a rentals object to the array' do
    person = Person.new(35, 'Eva', true)
    book = Book.new('Harry Potter', 'J. K. Rowling')
    rental = Rental.new('2022-12-3', book, person)
    person.add_rental(rental)
    expect(person.rentals.length).to eq(1)
  end
end
