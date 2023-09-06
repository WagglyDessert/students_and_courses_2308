class Student
  attr_reader :name, :age, :scores
  def initialize(student_details)
    @name = student_details[:name]
    @age = student_details[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    total_score = @scores.sum.to_f
    score_count = @scores.count.to_f
    total_score / score_count
  end

end