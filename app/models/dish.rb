class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :items
  validates :dish_group, :name, :description, :price, :photo, :restaurant_id,
  					presence: true
end
