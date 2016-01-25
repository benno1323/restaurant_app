class Item < ActiveRecord::Base
  belongs_to :dish
  validates :name, :calories, :dish_id, presence: true
end
