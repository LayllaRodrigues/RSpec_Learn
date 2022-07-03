RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    (actual % expected) == 0
  end
end

RSpec.describe "Math Matchers unit" do
  it "Should equals to PI value" do
    expect(Math::PI).to eq(3.141592653589793) # executa Math::PI == 3.14
  end

  it "Should accept PI float value" do
    expect(Math::PI).to be_within(0.01).of(3.14)
  end

  it "Verifies if a number is a multiple of another one with custom matcher" do
    expect(21).to be_a_multiple_of(7)
    expect(15).to be_a_multiple_of(3)
    expect(7).not_to be_a_multiple_of(3)
  end
end
