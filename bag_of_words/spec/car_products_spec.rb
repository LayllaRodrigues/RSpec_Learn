require "product"
require "cart_of_products"

RSpec.describe Cart do
  describe "#empty?" do
    it "returns true when the cart has no products" do
      cart = Cart.new(nil)

      # expect(cart.empty?).to be_truthy
      expect(cart).to be_empty # chama o método cart.empty?
    end
  end

  describe "#has_products?" do
    it "returns true if it has products" do
      product = Product.new("Macbook")
      cart = Cart.new(product)
      # chama o método cart.has_products?
      expect(cart).to have_products
    end
  end
end
