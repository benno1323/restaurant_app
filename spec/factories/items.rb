FactoryGirl.define do
  factory :item do
  	association :order
  	association :dish
		sequence(:name) { |n| "Item #{n}" }
		price "9.99"
  end

end