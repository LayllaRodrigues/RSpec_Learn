RSpec.describe "Integer Matchers unit" do
  it "Should accept 42 integer as test" do
    expect(Math::PI).to be_within(0.01).of(3.14)
  end

  it "Compare if 7 is less than 10" do
    expect(7).to be < 10
  end

  it "Compare if 7 is greater than 1" do
    expect(7).to be > 1
  end

  it "Compare if 7 is minor and equal to 7" do
    expect(7).to be <= 7
  end

  it "Compare 7 if is greater and mayor than 7" do
    expect(7).to be >= 7
  end
end
