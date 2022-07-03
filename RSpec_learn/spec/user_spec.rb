RSpec.describe "User Spec" do
  it "Should NOT save User with invalid attributes" do
    expect {
      invalid_attributes = { name: nil }
      user = User.new(invalid_attributes)
      user.save
    }.to_not change(User, :instance_variables)
  end
end
