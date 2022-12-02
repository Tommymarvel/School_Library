require './person'

class Teacher < Person
  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }.to_json(*args)
  end

  def can_use_services?
    true
  end
end
