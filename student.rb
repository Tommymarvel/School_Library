require './person'

class Student < Person
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }.to_json(*args)
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
