class ItemsController < ApplicationController
	before_action :load_dish
	before_action :authenticate_admin!

	def index
		@items = @dish.items
	end

	def show
		@item = @dish.items.find(params[:id])
	end

	def edit
		@item = @dish.items.find(params[:id])
	end

	def new
		@item = @dish.items.new
	end

	def create
		@item = @dish.items.build(item_params)

		if @item.save
			redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
		else
			render :new
		end
	end

	def update
		@item = @dish.items.find(params[:id])

		if @item.update(item_params)
			redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
		else
			render :edit
		end
	end

	def destroy
		@item = @dish.items.find(params[:id])
		@item.destroy
		redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
	end

	private

	def load_dish
		@dish = Dish.find(params[:dish_id])
	end

	def item_params
		params.require(:item).permit(:name, :calories)
	end
end