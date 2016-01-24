class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :dish
  validates :name, :price, :order_id, :dish_id, presence: true
end
