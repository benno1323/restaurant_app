class MyRestaurantsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@my_restaurants = Restaurant.where(admin: current_admin)
	end
end
