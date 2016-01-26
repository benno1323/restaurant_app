class RestaurantsController < ApplicationController
	before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!, except: [:index, :show]

	def index
		@restaurants = Restaurant.all
	end

	def show
	end

	def edit
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_admin.restaurants.build(restaurant_params)
		@restaurant.admin_id = current_admin.id

		if @restaurant.save
			redirect_to(my_restaurants_path, notice: 'Restaurant created successfully!')
		else
			render :new
		end
	end

	def update
		@restaurant.admin = current_admin
		if @restaurant.update(restaurant_params)
			redirect_to(my_restaurants_path, notice: 'Restaurant updated correctly!')
		else
			render :edit
		end
	end

	def destroy
		@restaurant.destroy
		redirect_to(my_restaurants_path, notice: 'Restaurant destroyed!')
	end

	private

	def find_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone, :logo)
	end
end
