class ItemsController < ApplicationController
	before_action :load_dish

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
			redirect_to(@dish)
		else
			render :new
		end
	end

	def update
		@item = @dish.items.find(params[:id])

		if @item.update(item_params)
			redirect_to(dish_item_path(@dish, @item))
		else
			render :edit
		end
	end

	def destroy
		@item = @dish.items.find(params[:id])
		@item.destroy
		redirect_to(@dish)
	end

	private

	def load_dish
		@dish = Dish.find(params[:dish_id])
	end

	def item_params
		params.require(:item).permit(:name, :price)
	end
end