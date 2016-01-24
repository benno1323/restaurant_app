require 'rails_helper'

RSpec.describe Order, type: :model do
	before(:all) do
		@order = build(:order)
	end

  it 'is valid with a date, sub_total, taxes, total and restaurant_id' do
  	expect(@order).to be_valid
  end

  it 'is invalid without a date' do
  	@order.date = nil
  	@order.valid?
  	expect(@order.errors[:date]).to include("can't be blank")
  end

  it 'is invalid without a sub_total' do
  	@order.sub_total = nil
  	@order.valid?
  	expect(@order.errors[:sub_total]).to include("can't be blank")
  end

  it 'is invalid without taxes' do
  	@order.taxes = nil
  	@order.valid?
  	expect(@order.errors[:taxes]).to include("can't be blank")
  end

  it 'is invalid without a restaurant_id' do
  	@order.restaurant_id = nil
  	@order.valid?
  	expect(@order.errors[:restaurant_id]).to include("can't be blank")
  end

  it 'has a number of items' do
    order = create(:order_with_items)
    expect(order.items.count).to eq(5)
  end
end
