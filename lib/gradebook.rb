class Gradebook
  attr_reader :instructor, :courses
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
  #creates hash
    students_by_course = {}
    @courses.each do |course|
      students_by_course[course] = [course.students]
    end
    return students_by_course
  #key is course
  #value is @students array
  end

  def students_below(threshold)
    students_below_grade = []
    @courses.each do |course|
      course.students.each do |student|
        if student.grade < threshold
        students_below_grade << student
        end
      end
    end
    return students_below_grade
  end

end