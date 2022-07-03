RSpec.describe "The lazy-evaluated behavior of let" do
  before { @foo = "bar" }

  let(:broken_operation) { raise "I'm broken" }

  it "Will call the method defined by let" do
    expect {
      expect(@foo).to eq("bar")
      broken_operation
    }.to raise_error("I'm broken")
  end

  it "Won't call the method defined by let" do
    expect {
      expect(@foo).to eq("bar")
    }.not_to raise_error
  end
end
