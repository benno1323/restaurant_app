FactoryGirl.define do
  factory :dish do
  	association :restaurant
		sequence(:dish_group) { |n| "Dish Group #{n}" }
		sequence(:name) { |n| "Dish #{n}" }
		description "MyText"
		price "9.99"
		photo "MyString"
  end

end
