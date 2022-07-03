RSpec.describe "String Matchers Examples" do
  string = "Laylla Rodrigues"

  it "Should match with regex" do
    expect(string).to match(/Laylla/)
    expect(string).to match(/Rodrigues/)
  end

  it "Should NOT match with regex" do
    expect(string).not_to match(/Maia/)
    expect(string).not_to match(/Reis/)
  end

  it "Should include some predefined strings or letters" do
    expect(string).to include("L")
    expect(string).to include("Laylla")
    expect(string).to include("Lay", "Rod")
  end

  it "Should NOT include some predefined strings" do
    expect(string).not_to include("batista")
    expect(string).not_to include("baus")
  end

  it "Should start with my own first name" do
    expect(string).to start_with("Laylla")
  end

  it "Should NOT START with my last name" do
    expect(string).not_to start_with("Rodrigues")
  end

  it "Should end with my last name" do
    expect(string).to end_with("Rodrigues")
  end

  it "Should NOT END with my first name" do
    expect(string).not_to end_with("Laylla")
  end
end
