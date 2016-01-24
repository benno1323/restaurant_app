class Restaurant < ActiveRecord::Base
	has_many :dishes
	validates :name, :description, :address, :phone, :logo, presence: true
end
