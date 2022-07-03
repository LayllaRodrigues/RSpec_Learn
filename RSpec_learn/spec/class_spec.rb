RSpec.describe "Class matchers example" do
  # be_an_instance_of verifica se o objeto é uma instância da
  # classe dada
  it "Check if Int value  belongs to Integer Module" do
    expect(5).to be_an_instance_of(Integer)
  end

  it "Check if Int value is an instance of Numeric" do
    expect(5).not_to be_an_instance_of(Numeric)
  end

  it "Check if Int is NOT an instance of String Module" do
    expect(5).not_to be_an_instance_of(String)
  end

  # be_a_kind_of verifica se o objeto é uma instância da classe
  # dada ou de uma subclasse da classe dada
  it "Check if Int is kind of Integer Module" do
    expect(5).to be_a_kind_of(Integer)
  end

  it "Check if Int is kind of Numeric" do
    expect(5).to be_a_kind_of(Numeric)
  end

  it "Check if Int is kind of Object" do
    expect(5).to be_a_kind_of(Object)
  end

  it "Check if Int is NOT kind of String Module" do
    expect(5).not_to be_a_kind_of(String)
  end
end
