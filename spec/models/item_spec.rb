require 'rails_helper'

RSpec.describe Item, type: :model do
	before(:all) do
		@item = build(:item)
	end

  it 'is valid with a name, price, order_id and dish_id' do
  	expect(@item).to be_valid
  end

  it 'is invalid without a name' do
  	@item.name = nil
  	@item.valid?
  	expect(@item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
  	@item.price = nil
  	@item.valid?
  	expect(@item.errors[:price]).to include("can't be blank")
  end

  # it 'is invalid without an order_id' do
  # 	@item.order_id = nil
  # 	@item.valid?
  # 	expect(@item.errors[:order_id]).to include("can't be blank")
  # end

  it 'is invalid without a dish_id' do
  	@item.dish_id = nil
  	@item.valid?
  	expect(@item.errors[:dish_id]).to include("can't be blank")
  end
end
