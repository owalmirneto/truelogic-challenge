require_relative "data";
require_relative "average";
require_relative "grades";
require_relative "ranking";

output = {
  average: Average.call(STUDENTS),
  grades: Grades.call(STUDENTS),
  failing_students: Ranking.call(STUDENTS, direction: :down),
  top_students: Ranking.call(STUDENTS, direction: :top)
};

puts output
