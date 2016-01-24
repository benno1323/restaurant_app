class Restaurant < ActiveRecord::Base
	validates :name, :description, :address, :phone, :logo, presence: true
end
