class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_service?
    is_of_age || parent_permission
  end
end
