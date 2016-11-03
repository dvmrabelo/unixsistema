require 'test_helper'

describe Product, type: :model do
  context 'validation' do
  	it 'invalid without name' do
  		product = Product.create(description: "camisa adc", color_id: 1, size_id: 2)
  		expect(product).to be_invalid
  	end

  	it 'invalid without description' do
  		product = Product.create(name: "Camisa ABC", color_id: 1, size_id: 2)
  		expect(product).to be_invalid
  	end

  	it 'invalid without color' do
  		product = Product.create(name: "Camisa ABC", description: "camisa adc", size_id: 2)
  		expect(product).to be_invalid
  	end

  	it 'invalid without size' do
  		product = Product.create(name: "Camisa ABC", description: "camisa adc", color_id: 1)
  		expect(product).to be_invalid
  	end

  	it 'valid with all' do
  		product = Product.create(name: "Camisa ABC", description: "camisa adc", color_id: 1, size_id: 2)
  		expect(product).to be_valid
  	end
  end
end


