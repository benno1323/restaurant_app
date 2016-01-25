FactoryGirl.define do
  factory :item do
  	association :dish
		sequence(:name) { |n| "Item #{n}" }
		calories 110
  end

end
