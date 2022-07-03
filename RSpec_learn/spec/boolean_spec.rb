RSpec.describe "Boolean Matchers Example" do
  it "Should return a true boolean association" do
    obj = true

    expect(obj).to be_truthy
  end

  it "Should return a false boolean association" do
    obj = false

    expect(obj).to be_falsey
  end

  it "Should return a true nil association" do
    obj = nil

    expect(obj).to be_nil
  end

  it "Should return if object exists" do
    obj = true

    expect(obj).to be
  end
end
