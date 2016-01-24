class Order < ActiveRecord::Base
  belongs_to :restaurant
  validates :date, :sub_total, :taxes, :total, :restaurant_id,
  					presence: true
end
