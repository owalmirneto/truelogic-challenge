require_relative "callable"

class Ranking < Callable
  def initialize(students, direction:, size: 3)
    @students = students
    @direction = direction
    @size = size
  end

  def call
    @students.send(direction_method, @size) { |s| s[:score] }.map { |s| s[:name] }
  end

  private

  def direction_method
    case @direction
    when :top then :max_by
    when :down then :min_by
    else
      raise ArgumentError, "Invalid direction: #{@direction}"
    end
  end
end
