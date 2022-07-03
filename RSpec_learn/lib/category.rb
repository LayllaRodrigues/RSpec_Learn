class Category
  attr_reader :name

  def initialize(name)
    @name = name
    @subcategories = []
  end

  def add_subcategories(*subcategories)
    @subcategories << subcategories
  end

  def subcategories
    @subcategories.flatten
  end
end
