class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :items
  validates :dish_group, :name, :description, :price, :restaurant_id,
  					presence: true

  mount_uploader :photo, PhotoUploader
end
