
require_relative "callable"
require_relative "total_score"

class Average < Callable
  def initialize(students)
    @students = students
  end

  def call
    TotalScore.call(@students) / @students.size
  end
end
