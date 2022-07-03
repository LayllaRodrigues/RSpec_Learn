class Product
  attr_reader :name

  def initialize(name)
    name.nil? ? @name = "Unkown Product" : @name = name
  end
end
