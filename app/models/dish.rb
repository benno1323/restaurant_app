class Dish < ActiveRecord::Base
  belongs_to :restaurant
  validates :dish_group, :name, :description, :price, :photo, :restaurant_id,
  					presence: true
end
