require 'rails_helper'

RSpec.describe Dish, type: :model do
	before(:all) do
		@dish = build(:dish)
	end

  it 'is valid with a dish_group, name, description, price and photo' do
  	expect(@dish).to be_valid
  end

  it 'is invalid without a dish_group' do
  	@dish.dish_group = nil
  	@dish.valid?
  	expect(@dish.errors[:dish_group]).to include("can't be blank")
  end

  it 'is invalid without a name' do
  	@dish.name = nil
  	@dish.valid?
  	expect(@dish.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
  	@dish.description = nil
  	@dish.valid?
  	expect(@dish.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a price' do
  	@dish.price = nil
  	@dish.valid?
  	expect(@dish.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without a photo' do
  	@dish.photo = nil
  	@dish.valid?
  	expect(@dish.errors[:photo]).to include("can't be blank")
  end

  it 'is invalid without a restaurant_id' do
  	@dish.restaurant_id = nil
  	@dish.valid?
  	expect(@dish.errors[:restaurant_id]).to include("can't be blank")
  end

  it 'has a number of items' do
    dish = create(:dish_with_items)
    expect(dish.items.count).to eq(5)
  end
end
