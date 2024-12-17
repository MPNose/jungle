require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: 'Test Category') }
    describe 'Validations' do
      it 'is valid with a name, price, quantity, and category' do
        product = Product.new(
          name: 'Test Product',
          price_cents: 1000,
          quantity: 10,
          category: category
        )
        expect(product).to be_valid
      end
      it 'is invalid without a name' do
        product = Product.new(
          name: nil,
          price_cents: 1000,
          quantity: 10,
          category: category
        )
        product.valid?
        expect(product.errors.full_messages).to include("Name can't be blank")
      end
      it 'is invalid without a price' do
        product = Product.new(
          name: 'test product',
          price_cents: nil,
          quantity: 10,
          category: category 
        )
        product.valid?
        expect(product.errors.full_messages).to include("Price can't be blank")
      end
      it 'is invalid without a quantity' do
        product = Product.new(
          name: 'Test Product',
          price_cents: 1000,
          quantity: nil,
          category: category
        )
        product.valid?
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'is invalid without a category' do 
        product = Product.new(
          name: 'Test Product',
          price_cents: 1000,
          quantity: 10,
          category: nil 
        )
        product.valid?
        expect(product.errors.full_messages).to include("Category can't be blank")
      end
 end
end
