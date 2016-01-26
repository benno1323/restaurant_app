class Restaurant < ActiveRecord::Base
	has_many :dishes, dependent: :destroy
	has_many :orders, dependent: :destroy
	belongs_to :admin
	validates :name, :description, :address, :phone, :logo, presence: true

	mount_uploader :logo, LogoUploader
end
