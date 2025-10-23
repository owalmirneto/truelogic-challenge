require_relative "../src/data"
require_relative "../src/total_score"

describe TotalScore do
  describe ".call" do
    it { expect(described_class.call([{score: 10}, {score: 90}])).to eq(100) }
    it { expect(described_class.call(STUDENTS)).to eq(743) }
  end
end
