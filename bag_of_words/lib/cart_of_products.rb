class Cart
    def initialize(product)
      @products = {}
    end
   
    def has_products?
      @products.empty?
    end
   
    def empty?
      has_products?
    end
   
end

