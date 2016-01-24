require 'rails_helper'

RSpec.describe Restaurant, type: :model do
	before(:all) do
		@restaurant = build(:restaurant)
	end

  it 'is valid with a name, description, address, phone and logo' do
  	expect(@restaurant).to be_valid
  end

  it 'is invalid without a name' do
  	@restaurant.name = nil
  	@restaurant.valid?
  	expect(@restaurant.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
  	@restaurant.description = nil
  	@restaurant.valid?
  	expect(@restaurant.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without an address' do
  	@restaurant.address = nil
  	@restaurant.valid?
  	expect(@restaurant.errors[:address]).to include("can't be blank")
  end

  it 'is invalid without a phone' do
  	@restaurant.phone = nil
  	@restaurant.valid?
  	expect(@restaurant.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid without a logo' do
  	@restaurant.logo = nil
  	@restaurant.valid?
  	expect(@restaurant.errors[:logo]).to include("can't be blank")
  end

  it 'has a number of orders' do
    restaurant = create(:restaurant_with_orders)
    expect(restaurant.orders.count).to eq(5)
  end

  it 'has a number of dishes' do
    restaurant = create(:restaurant_with_dishes)
    expect(restaurant.dishes.count).to eq(5)
  end
end
