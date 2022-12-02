require './student'
require './teacher'
require './rental'
require './book'
require 'json'

class App
  attr_accessor :people, :book, :rental

  def initialize()
    @people = []
    @books = []
    @book = nil
    @rentals = []
    @person = nil
    
    if File.file?('people.json')
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
      f.close()
    end

    if File.file?('books.json')
      f = File.new('books.json', 'r')
      f.gets.chomp.split('||').each do |book|
        data = JSON.parse(book)
        @books << Book.new(data['title'], data['author'])
      end
      f.close()
    end

    if File.file?('rentals.json')
      f = File.new('rentals.json', 'r')
      f.gets.chomp.split('||').each do |rental|
        data = JSON.parse(rental)
        person = @people.select { |person| person.id == data['person']['id'] }.first
        book = @books.select { |book| book.title == data['book']['title'] }.first
        @rentals << Rental.new(data['date'], book, person)
      end
      f.close()
    end
  end

  def list_all_books
    if @books.length.zero?
      puts 'There are no books found, Kindly add at least one book'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'You need at least one person'
    else
      @people.map.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_student
    puts 'Great! Let\'s create the student!'
    print 'Student age: '
    stdage = gets.chomp.to_i
    print 'Student name: '
    stdname = gets.chomp
    print 'Student class: '
    stdclass = gets.chomp
    print 'Parent permission? true / false: '
    std_p_p = gets.chomp
    case std_p_p
    when 'true'
      @people.push(Student.new(stdage, stdname, true, stdclass))
      puts 'Student is created successfully'
    when 'false'
      @people.push(Student.new(stdage, stdname, false, stdclass))
      puts 'Student is created successfully'
    else
      puts 'That was an invalid entry'
    end
  end

  def create_a_person
    print 'Hello! Would you like to create a:
        1. Student
        2. Teacher
        choose between the two: '
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student

    when 2
      puts 'Great! let\'s create the Teacher!'
      print 'Teacher age: '
      teacher_age = gets.chomp.to_i
      print 'Teacher name: '
      teacher_name = gets.chomp
      print 'Teacher specialization: '
      teacher_specs = gets.chomp
      @people.push(Teacher.new(teacher_age, teacher_name, true, teacher_specs))
      puts 'Teacher is created successfully'
    end
  end

  def create_a_book
    print 'Splendid! we love new books.
    Enter the book title: '
    book_title = gets.chomp
    print 'Enter the book\'s author: '
    book_author = gets.chomp
    @books.push(Book.new(book_title, book_author))
    puts 'Book was added succesfully!'
  end

  def create_a_rental
    puts 'Select the id of the book you want: '
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    number = gets.chomp.to_i
    index = number - 1

    puts 'Type your ID: '
    @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
    identity = gets.chomp.to_i

    individual = @people.select { |person| person.id == identity }.first

    print 'Enter date of renting the book:(yyyy-mm-dd) '
    date = gets.chomp.to_s
    rent = Rental.new(date, @books[index], individual)
    @rentals << rent

    puts 'Book rented successfully'
  end

  def list_all_rentals_id
    puts 'There are no rentals available at the moment' if @rentals.empty?
    print 'Wonderful! let\'s find your book!\n, Type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rent| rent.person.id == id }
    if rental.empty?
      puts 'Sorry there are no records for that ID'
    else
      puts 'Here are your records: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}) Date: #{record.date} Borrower: #{record.person.name}
         Status: #{record.person.class} Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
      end
    end
  end

  def quit_app
    f = File.new('people.json', 'w')
    f.puts("#{ @people.map(&:to_json).join('||') }")
    f.close()
    f = File.new('books.json', 'w')
    f.puts("#{ @books.map(&:to_json).join('||') }")
    f.close()
    f = File.new('rentals.json', 'w')
    f.puts("#{ @rentals.map(&:to_json).join('||') }")
    f.close()
    puts 'Thank you for using my app!'
    exit(true)
  end
end
