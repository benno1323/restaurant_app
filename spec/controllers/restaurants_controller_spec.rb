require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
	let(:valid_attributes) { attributes_for(:restaurant) }
	let(:invalid_attributes) { attributes_for(:restaurant, name: nil) }
	let(:updated_attributes) { attributes_for(:restaurant, name: 'Updated name') }

	before(:each) do
		@restaurant = create(:restaurant)
	end

	describe 'GET #index' do
		it 'renders the index template' do
			get :index
			expect(response).to render_template(:index)
		end

		it 'assigns a list of restaurants' do
			get :index
			expect(assigns(:restaurants)).to eq([@restaurant])
		end
	end

	describe 'GET #show' do
		it 'renders the show template' do
			get :show, id: @restaurant
			expect(response).to render_template(:show)
		end

		it 'retrieves a restaurant from the database' do
			get :show, id: @restaurant
			expect(assigns(:restaurant)).to eq(@restaurant)
		end
	end

	describe 'GET #edit' do
		it 'renders the edit template' do
			get :edit, id: @restaurant
			expect(response).to render_template(:edit)
		end

		it 'retrieves a restaurant from the database' do
			get :edit, id: @restaurant
			expect(assigns(:restaurant)).to eq(@restaurant)
		end
	end

	describe 'GET #new' do
		it 'renders the new template' do
			get :new
			expect(response).to render_template(:new)
		end

		it 'assigns a new restaurant' do
			get :new
			expect(assigns(:restaurant)).to be_a_new(Restaurant)
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves a new restaurant in the database' do
				expect {
					post :create, restaurant: valid_attributes
					}.to change(Restaurant, :count).by(1)
			end

			it 'redirects to restaurants#index' do
				post :create, restaurant: valid_attributes
				expect(response).to redirect_to(restaurants_path)
			end
		end

		context 'with invalid attributes' do
			it 'does not save a restaurant in the database' do
				expect {
					post :create, restaurant: invalid_attributes
					}.to_not change(Restaurant, :count)
			end

			it 're-renders the new template' do
				post :create, restaurant: invalid_attributes
				expect(response).to render_template(:new)
			end
		end
	end

	describe 'PATCH #update' do
		context 'with valid attributes' do
			it 'it updates a restaurant attribute' do
				patch :update, id: @restaurant, restaurant: updated_attributes
				@restaurant.reload
				expect(assigns(:restaurant).name).to eq('Updated name')
			end

			it 'redirects to the updated restaurant' do
				patch :update, id: @restaurant, restaurant: updated_attributes
				@restaurant.reload
				expect(response).to redirect_to(restaurant_path(assigns(:restaurant)))
			end
		end

		context 'with invalid attributes' do
			it 'does not updates a restaurant attribute' do
				patch :update, id: @restaurant, restaurant: invalid_attributes
				@restaurant.reload
				expect(@restaurant.name).to_not eq(nil)
			end

			it 're-renders the edit template' do
				patch :update, id: @restaurant, restaurant: invalid_attributes
				expect(response).to render_template(:edit)
			end
		end
	end

	describe 'DELETE #destroy' do
		it 'retrieves a restaurant from the database' do
			delete :destroy, id: @restaurant
			expect(assigns(:restaurant)).to eq(@restaurant)
		end

		it 'deletes a restaurant from the database' do
			expect {
				delete :destroy, id: @restaurant
				}.to change(Restaurant, :count).by(-1)
		end

		it 'redirects to restaurants#index' do
			delete :destroy, id: @restaurant
			expect(response).to redirect_to(restaurants_path)
		end
	end
end
