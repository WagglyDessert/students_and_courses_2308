require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Course do
  it "exists" do
    gradebook = Gradebook.new("Mr_T")
    expect(gradebook).to be_instance_of(Gradebook)
  end

  it "has attributes" do
    gradebook = Gradebook.new("Mr_T")
    expect(gradebook.instructor).to eq("Mr_T")
  end

  it "can add courses" do
    gradebook = Gradebook.new("Mr_T")
    calculus = Course.new("Calculus")
    paleontology = Course.new("Paleontology")
    gradebook.add_course(calculus)
    gradebook.add_course(paleontology)
    #require 'pry'; binding.pry
    expect(gradebook.courses).to eq([calculus, paleontology])
  end

  it "can list_all_students" do
    gradebook = Gradebook.new("Mr_T")
    calculus = Course.new("Calculus")
    paleontology = Course.new("Paleontology")
    gradebook.add_course(calculus)
    gradebook.add_course(paleontology)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    calculus.enroll(student1)
    calculus.enroll(student2)
    paleontology.enroll(student1)
    #require 'pry'; binding.pry
    expect(gradebook.list_all_students).to eq({calculus => [calculus.students], paleontology =>[paleontology.students]})
  end

  it "can find failing students" do
    gradebook = Gradebook.new("Mr_T")
    calculus = Course.new("Calculus")
    paleontology = Course.new("Paleontology")
    gradebook.add_course(calculus)
    gradebook.add_course(paleontology)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    calculus.enroll(student1)
    calculus.enroll(student2)
    paleontology.enroll(student1)
    student1.log_score(89)
    student1.log_score(78)
    student2.log_score(45)
    #require 'pry'; binding.pry
    expect(gradebook.students_below(50)).to eq([student2])
  end
end