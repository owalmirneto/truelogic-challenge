class Students
  LIST = [
    { name: "Alice", score: 95 },
    { name: "Bob", score: 58 },
    { name: "Charlie", score: 72 },
    { name: "Daisy", score: 88 },
    { name: "Eve", score: 40 },
    { name: "Frank", score: 65 },
    { name: "Grace", score: 81 },
    { name: "Hank", score: 90 },
    { name: "Ivy", score: 100 },
    { name: "Jack", score: 54 }
  ]

  RANGE_GRADES = {
    A: 90..100,
    B: 80..89,
    C: 70..79,
    D: 60..69,
    F: 0..59
  }

  def self.total_score
    output = 0

    Students::LIST.map do |student|
      output = output + student[:score]
    end

    output
  end

  def self.average
    Students.total_score / Students::LIST.size.to_f
  end

  def self.grades
    output = {}

    Students::LIST.map do |student|
      Students::RANGE_GRADES.keys.map do |grade|
        if Students::RANGE_GRADES[grade].to_a.include?(student[:score])
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

      Students::LIST.map do |student|
      @grouped[student[:score]] = student[:name]
      end

      @grouped
    end
  end
end
