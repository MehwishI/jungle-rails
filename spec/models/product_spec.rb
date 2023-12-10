require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    category = Category.create(name: "Clothes")
    @product = Product.new(name:"Shirt",price: 20, quantity:10, category: category)
    # before(:each)
    # before(:example) do
    #   @thing = Thing.new
    # end

    it 'should  exist for new records' do
      category = Category.create(name: "Clothes")
      @product = Product.new(name:"Shirt",price: 20, quantity:10, category: category)
      # @product.name = "Shirt"
      # @product.price = "100"
       #@product.save!
      expect(@product.name).to be_present
    end
    it 'should  exist for new records' do
      @category=  Category.new
      @category.products 
      @product = Product.new
      expect(@product.price).to be_present
    end
    it 'should  exist for new records' do
      @product = Product.new
      expect(@product.quantity).to be_present
    end
    it 'should  exist for new records' do
      @product = Product.new
      expect(@product.category).to be_present
    end
  end
end