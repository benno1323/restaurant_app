FactoryGirl.define do
  factory :restaurant do
		name 				{ Faker::Company.name }
		description	{ Faker::Company.catch_phrase }
		address 		{ Faker::Address.street_address }
		phone 			{ Faker::PhoneNumber.phone_number }
		logo 				"image.jpg"

		factory :restaurant_with_orders do
			transient do
				orders_count 5
			end

			after(:create) do |restaurant, evaluator|
				FactoryGirl.create_list(:order, evaluator.orders_count, restaurant: restaurant)
			end
		end

		factory :restaurant_with_dishes do
			transient do
				dishes_count 5
			end

			after(:create) do |restaurant, evaluator|
				FactoryGirl.create_list(:dish, evaluator.dishes_count, restaurant: restaurant)
			end
		end
	end
end
