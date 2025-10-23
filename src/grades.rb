require_relative "callable"

class Grades < Callable
  RANGE_RULES = {
    A: 90..100,
    B: 80..89,
    C: 70..79,
    D: 60..69,
    F: 0..59
  }

  def initialize(students)
    @students = students
  end

  def call
    RANGE_RULES.transform_values do |range|
      @students.count { |student| range.cover?(student[:score]) }
    end
  end
end
