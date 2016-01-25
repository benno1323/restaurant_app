class Item < ActiveRecord::Base
  belongs_to :dish
  validates :name, :price, :dish_id, presence: true
end
