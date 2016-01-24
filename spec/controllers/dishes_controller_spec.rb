require 'rails_helper'

RSpec.describe DishesController, type: :controller do
	let(:valid_attributes) { attributes_for(:dish) }
	let(:invalid_attributes) { attributes_for(:dish, name: nil) }
	let(:updated_attributes) { attributes_for(:dish, name: 'Updated name') }

	before(:each) do
		@restaurant = create(:restaurant)
		@dish = create(:dish)
		@restaurant.dishes << @dish
	end

	describe 'GET #index' do
		it 'renders the index template' do
			get :index, restaurant_id: @restaurant
			expect(response).to render_template(:index)
		end

		it 'retrieves a list of dishes from the database' do
			get :index, restaurant_id: @restaurant
			expect(assigns(:dishes)).to eq(@restaurant.dishes)
		end
	end

	describe 'GET #show' do
		it 'renders the show template' do
			get :show, { restaurant_id: @restaurant, id: @dish }
			expect(response).to render_template(:show)
		end

		it 'retrieves a dish from the database' do
			get :show, restaurant_id: @restaurant, id: @dish
			expect(assigns(:dish)).to eq(@dish)
		end
	end

	describe 'GET #edit' do
		it 'retrieves a dish from the database' do
			get :edit, restaurant_id: @restaurant, id: @dish
			expect(assigns(:dish)).to eq(@dish)
		end

		it 'renders the edit template' do
			get :edit, restaurant_id: @restaurant, id: @dish
			expect(response).to render_template(:edit)
		end
	end

	describe 'GET #new' do
		it 'renders the restaurants/new template' do
			get :new, restaurant_id: @restaurant
			expect(response).to render_template(:new)
		end

		it 'assigns a new dish' do
			get :new, restaurant_id: @restaurant
			expect(assigns(:dish)).to be_a_new(Dish)
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves a dish in the database' do
				expect {
					post :create, restaurant_id: @restaurant,
						dish: valid_attributes
					}.to change(Dish, :count).by(1)
			end

			it 'redirects to the restaurants#show' do
				post :create, restaurant_id: @restaurant, dish: valid_attributes
				expect(response).to redirect_to(@restaurant)
			end
		end

		context 'with invalid attributes' do
			it 'does not save a dish in the database' do
				expect {
					post :create, restaurant_id: @restaurant,
						dish: invalid_attributes
					}.to_not change(Dish, :count)
			end

			it 're-renders the restaurant/show template' do
				post :create, restaurant_id: @restaurant, dish: invalid_attributes
				expect(response).to render_template('restaurants/show')
			end
		end
	end

	describe 'PATCH #update' do
		context 'with valid attributes' do
			it 'updates a dish attribute' do
				patch :update, restaurant_id: @restaurant, id: @dish,
											 dish: updated_attributes
				@dish.reload
				expect(@dish.name).to eq('Updated name')
			end

			it 'redirects to dish#show' do
				patch :update, restaurant_id: @restaurant, id: @dish,
											 dish: updated_attributes
				expect(response).to redirect_to(restaurant_dish_path(@restaurant, @dish))
			end
		end

		context 'with invalid attributes' do
			it 'does not update a dish attribute' do
				patch :update, restaurant_id: @restaurant, id: @dish,
											 dish: invalid_attributes
				@dish.reload
				expect(@dish.name).to_not eq(nil)
			end

			it 're-renders the edit template' do
				patch :update, restaurant_id: @restaurant, id: @dish,
											 dish: invalid_attributes
				expect(response).to render_template(:edit)
			end
		end
	end

	describe 'DELETE #destroy' do
		it 'retrieves a dish from the database' do
			delete :destroy, restaurant_id: @restaurant, id: @dish
			expect(assigns(:dish)).to eq(@dish)
		end

		it 'deletes a dish from the database' do
			expect {
				delete :destroy, restaurant_id: @restaurant, id: @dish
				}.to change(Dish, :count).by(-1)
		end

		it 'redirects to restaurant#show view' do
			delete :destroy, restaurant_id: @restaurant, id: @dish
			expect(response).to redirect_to(restaurant_path(@restaurant))
		end
	end
end
