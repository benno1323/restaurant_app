FactoryGirl.define do
  factory :order do
  	association :restaurant
		date Date.today.strftime("%b %d, %Y")
		sub_total { Faker::Commerce.price }
		taxes			{ Faker::Commerce.price }
		total 		{ Faker::Commerce.price }
  end
end
