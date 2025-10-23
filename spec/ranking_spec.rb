require_relative "../src/data"
require_relative "../src/ranking"

describe Ranking do
  describe ".call" do
    it { expect(described_class.call(STUDENTS, direction: :top)).to eq(["Ivy", "Alice", "Hank"]) }
    it { expect(described_class.call(STUDENTS, direction: :down)).to eq(["Eve", "Jack", "Bob"]) }
    it { expect{ described_class.call(STUDENTS, direction: :invalid) }.to raise_error(ArgumentError, "Invalid direction: invalid") }
  end
end
