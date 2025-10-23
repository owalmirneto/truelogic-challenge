require_relative "callable"

class TotalScore < Callable
  def initialize(students)
    @students = students
  end

  def call
    @students.sum { |student| student[:score].to_f }
  end
end
