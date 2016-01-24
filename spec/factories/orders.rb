FactoryGirl.define do
  factory :order do
  	association :restaurant
		date Date.today.strftime("%b %d, %Y")
		sub_total { Faker::Commerce.price }
		taxes			{ Faker::Commerce.price }
		total 		{ Faker::Commerce.price }

		factory :order_with_items do
			transient do
				items_count 5
			end

			after(:create) do |order, evaluator|
				FactoryGirl.create_list(:item, evaluator.items_count, order: order)
			end
		end
  end
end
