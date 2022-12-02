require './student'
require './teacher'
require './rental'
require './book'
require 'json'

class Loading
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def load_people
    return unless File.file?('people.json')

    f = File.new('people.json', 'r')
    f.gets.chomp.split('||').each do |person|
      data = JSON.parse(person)
      case data['json_class']
      when 'Student'
        person = Student.new(data['age'], data['name'], data['parent_permission'], data['classroom'])
      when 'Teacher'
        person = Teacher.new(data['age'], data['name'], data['parent_permission'], data['specialization'])
      end
      person.id = data['id']
      @people << person
    end
    f.close
  end

  def load_books
    return unless File.file?('books.json')

    f = File.new('books.json', 'r')
    f.gets.chomp.split('||').each do |book|
      data = JSON.parse(book)
      @books << Book.new(data['title'], data['author'])
    end
    f.close
  end

  def load_rentals
    return unless File.file?('rentals.json')

    f = File.new('rentals.json', 'r')
    f.gets.chomp.split('||').each do |rental|
      data = JSON.parse(rental)
      person = @people.select { |p| p.id == data['person']['id'] }.first
      book = @books.select { |b| b.title == data['book']['title'] }.first
      @rentals << Rental.new(data['date'], book, person)
    end
    f.close
  end

  def store_data
    f = File.new('people.json', 'w')
    f.puts(@people.map(&:to_json).join('||').to_s)
    f.close
    f = File.new('books.json', 'w')
    f.puts(@books.map(&:to_json).join('||').to_s)
    f.close
    f = File.new('rentals.json', 'w')
    f.puts(@rentals.map(&:to_json).join('||').to_s)
    f.close
  end
end
