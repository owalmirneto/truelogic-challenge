require_relative "../src/data"
require_relative "../src/average"

describe Average do
  describe ".call" do
    it { expect(described_class.call([{score: 10}, {score: 90}])).to eq(50) }
    it { expect(described_class.call(STUDENTS)).to eq(74.3) }
  end
end
