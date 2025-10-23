require_relative "data"

class Students
  def self.total_score
    output = 0

    STUDENTS.map do |student|
      output += student[:score]
    end

    output
  end

  def self.average
    Students.total_score / STUDENTS.size.to_f
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
