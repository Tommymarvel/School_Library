require './person'
class Student < Person
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
