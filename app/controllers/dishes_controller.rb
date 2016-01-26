class DishesController < ApplicationController
	before_action :load_restaurant, except: :destroy
	before_action :find_restaurant_dish, only: [:show, :edit, :update]
	before_action :authenticate_admin!, except: :show

	def index
		@dishes = @restaurant.dishes
	end

	def show
		total_calories
	end

	def edit
	end

	def new
		@dish = @restaurant.dishes.build
	end

	def create
		@dish = @restaurant.dishes.build(dish_params)

		if @dish.save
			redirect_to(@restaurant, notice: 'Dish created successfully!')
		else
			render 'restaurants/show'
		end
	end

	def update
		if @dish.update(dish_params)
			redirect_to(restaurant_dish_path(@restaurant, @dish), notice: 'Dish updated successfully!')
		else
			render :edit
		end
	end

	def destroy
		@dish = Dish.find(params[:id])
		@restaurant = Restaurant.find(@dish.restaurant_id)
		@dish.destroy
		redirect_to(@restaurant, alert: 'Dish destroyed!')
	end

	private

	def find_restaurant_dish
		@dish = @restaurant.dishes.find(params[:id])
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def dish_params
		params.require(:dish).permit(:dish_group, :name, :description, :price, :photo)
	end

	def total_calories
		@total_calories = 0
		@dish.items.each do |item|
			@total_calories = @total_calories + item.calories
		end
	end
end
