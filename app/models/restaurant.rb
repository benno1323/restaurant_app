class Restaurant < ActiveRecord::Base
	has_many :dishes
	has_many :orders
	validates :name, :description, :address, :phone, :logo, presence: true
end
