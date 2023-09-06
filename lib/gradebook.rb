class Gradebook
  attr_reader :instructor, :courses, :list_of_courses
  def initialize(instructor, courses)
    @instructor = instructor
    @courses = courses.split.Course.new
    @list_of_courses = []
    @list_of_courses << @courses
  end

  def add_course(course)
    @courses.push(course)
    course.each do |course_data|
    course_data = [@name, @capacity]
    course = Course.new(course_data)
    @list_of_courses << course
    end
  end

  def list_all_students
  #creates hash
    students_by_course = {}
    @list_of_courses.each do |course|
      students_by_course[course.name] = [course.students]
    end
    return students_by_course
  #key is course
  #value is @students array
  end
end