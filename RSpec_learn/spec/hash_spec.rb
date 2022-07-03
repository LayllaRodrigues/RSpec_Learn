RSpec.describe "Hash Matchers unit" do
  hash = { a: 7, b: 5 }
  it "Should include some predefined keys" do
    expect(hash).to include(:a)
    expect(hash).to include(:a, :b)
  end

  it "Should include some predefined keys with values" do
    expect(hash).to include(a: 7)
    expect(hash).to include(b: 5, a: 7)
  end

  it "Should NOT include some keys and values" do
    expect(hash).not_to include(:c)
    expect(hash).not_to include(a: 11)
    expect(hash).not_to include(a: 13, c: 11)
    expect(hash).not_to include(:c, :d)
  end
end
