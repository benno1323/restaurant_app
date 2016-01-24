FactoryGirl.define do
  factory :restaurant do
		name 				{ Faker::Company.name }
		description	{ Faker::Company.catch_phrase }
		address 		{ Faker::Address.street_address }
		phone 			{ Faker::PhoneNumber.phone_number }
		logo 				"image.jpg"
	end
end
