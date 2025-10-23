require_relative "data"
require_relative "average"

class Students
  def self.average
    Average.call(STUDENTS)
  end

  def self.grades
    output = {}

    STUDENTS.map do |student|
      RANGE_GRADE_RULES.keys.map do |grade|
        if RANGE_GRADE_RULES[grade].to_a.include?(student[:score])
          output[grade] = output[grade] ? output[grade] + 1 : 1
        end
      end
    end

    output
  end

  def self.failing_students
    Students.grouped_students.sort.take(3).reverse.map { |_, name| name }
  end

  def self.top_students
    Students.grouped_students.sort.reverse.take(3).map { |_, name| name }
  end

  def self.grouped_students
    @grouped_students ||= begin
      @grouped = {}

      STUDENTS.map do |student|
        @grouped[student[:score]] = student[:name]
      end

      @grouped
    end
  end
end
