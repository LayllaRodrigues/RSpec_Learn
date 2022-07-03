RSpec::Matchers.define :contain_products do |*products|
  match do |category|
    # subcategories_products = category.subcategories.flat_map(&:product)
    subcategories_products = category.subcategories.flat_map(&:product).flat_map(&:name)

    expect(subcategories_products & products).to eq products
  end

  # If test fail:
  failure_message do |category|
    "expected category '#{category.name}' " \
    "to contain products #{products}"
  end
end

RSpec.describe Category do
  it "Contains all the products of its subcategories" do
    eletronics = Category.new("eletronics")
    computers = Subcategory.new("computers")
    smartphones = Subcategory.new("smartphones")

    computers.add_product("Macbook")
    smartphones.add_product("iPhone")

    eletronics.add_subcategories(computers, smartphones)

    # eletronic_products = eletronics.subcategories.flat_map(&:products)

    # Método que verifica se contém produtos
    expect(eletronics).to contain_products("Macbook", "iPhone") # E evita falha por conter um array vazio no inicio
  end
end
