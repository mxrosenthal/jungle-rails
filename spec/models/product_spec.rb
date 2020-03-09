require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates the a product is valid." do
      @category = Category.new(name: "Home")
      @product = Product.new(name: "Snow Blower", price: 400, quantity: 50, category: @category)
      expect(@product).to be_valid
    end
    it "Throws error when name is ommited." do
      @category = Category.new(name: "Home")
      @product = Product.new(name: nil, price: 400, quantity: 50, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to contain_exactly("Name can't be blank")
    end
    it "Throws error when price is ommited." do
      @category = Category.new(name: "Home")
      @product = Product.new(name: "Snow Blower", price: nil, quantity: 50, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to contain_exactly("Price can't be blank", "Price cents is not a number", "Price is not a number")

    end
    it "Throws error when quantity is ommited." do
      @category = Category.new(name: "Home")
      @product = Product.new(name: "Snow Blower", price: 400, quantity: nil, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to contain_exactly("Quantity can't be blank") 
    end
    it "Throws error when category is ommited." do
      @category = Category.new(name: "Home")
      @product = Product.new(name: "Snow Blower", price: 400, quantity: 50, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to contain_exactly("Category can't be blank")
    end
    

  end
end
