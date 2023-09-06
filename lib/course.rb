class Course
  attr_reader :name, :capacity, :students
  def initialize(name, capacity = 0)
    @name = name
    @capacity = capacity
    @students = []
  end

  def full?
    a = @students.count
    b = @capacity
    if a == nil
      return false
    elsif a < b
      return false
    else
      return true
    end
  end

  def enroll(student)
    @students << student
  end

end
