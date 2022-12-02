require './nameable'
require 'json'

class Person < Nameable
  attr_reader :rentals
  attr_accessor :id, :name, :age

  def initialize(age, name = 'unknown', parent_permission = 'true')
    super()
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rentals)
    @rentals << rentals
    rentals.person = self
  end

  def can_use_service?
    of_age || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
