require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Course do
  it "exists" do
    gradebook = Gradebook.new("Mr_T", "Calculus")
    expect(gradebook).to be_instance_of(Gradebook)
  end

  it "has attributes" do
    gradebook = Gradebook.new("Mr_T", "Calculus")
    expect(gradebook.instructor).to eq("Mr_T")
    expect(gradebook.courses).to eq(["Calculus"])
  end

  it "can add courses" do
    gradebook = Gradebook.new("Mr_T", "Calculus")
    gradebook.add_course("Paleontology")
    expect(gradebook.courses).to eq(["Calculus", "Paleontology"])
  end

  it "can list_all_students" do
    gradebook = Gradebook.new("Mr_T", "Calculus")
    gradebook.add_course("Paleontology")
    #course_calculus = Course.new("Calculus", 2)
    #course_paleontology = Course.new("Paleontology")
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    course("Calculus").enroll(student1)
    course("Calculus").enroll(student2)
    course("Paleontology").enroll(student1)
    #require 'pry'; binding.pry
    expect(gradebook.list_all_students).to eq({"Calculus" => [student1, student2], "Paleontology" =>[nil]})
  end

end