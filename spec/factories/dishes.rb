FactoryGirl.define do
  factory :dish do
  	association :restaurant
		sequence(:dish_group) { |n| "Dish Group #{n}" }
		sequence(:name) { |n| "Dish #{n}" }
		description "MyText"
		price "9.99"
		photo "MyString"

		factory :dish_with_items do
			transient do
				items_count 5
			end

			after(:create) do |dish, evaluator|
				FactoryGirl.create_list(:item, evaluator.items_count, dish: dish)
			end
		end
  end

end
