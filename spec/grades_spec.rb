require_relative "../src/data"
require_relative "../src/grades"

describe Grades do
  describe ".call" do
    it { expect(described_class.call([{score: 10}, {score: 90}])).to eq({ A: 1, B: 0, C: 0, D: 0, F: 1 }) }
    it { expect(described_class.call(STUDENTS)).to eq({ A: 3, B: 2, C: 1, D: 1, F: 3 }) }
  end
end
