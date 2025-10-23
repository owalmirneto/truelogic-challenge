require_relative "../src/students"

describe Students do
  describe ".total_score" do
    it { expect(Students.total_score).to eq(743) }
  end

  describe ".average" do
    it { expect(Students.average).to eq(74.3) }
  end

  describe ".grades" do
    it { expect(Students.grades).to eq({ A: 3, B: 2, C: 1, D: 1, F: 3 }) }
  end

  describe ".top_students" do
    it { expect(Students.top_students).to eq(["Ivy", "Alice", "Hank"]) }
  end

  describe ".failing_students" do
    it { expect(Students.failing_students).to eq(["Bob", "Jack", "Eve"]) }
  end
end
