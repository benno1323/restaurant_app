require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	let(:valid_attributes) { attributes_for(:item) }
	let(:invalid_attributes) { attributes_for(:item, name: nil) }
	let(:updated_attributes) { attributes_for(:item, name: 'Updated name') }

	before(:each) do
		@dish = create(:dish)
		@item = create(:item)
		@dish.items << @item
	end

	describe 'GET #index' do
		it 'renders the index template' do
			get :index, dish_id: @dish
			expect(response).to render_template(:index)
		end

		it 'retrieves a list of items from the database' do
			get :index, dish_id: @dish
			expect(assigns(:items)).to eq(@dish.items)
		end
	end

	describe 'GET #show' do
		it 'renders the show template' do
			get :show, { dish_id: @dish, id: @item }
			expect(response).to render_template(:show)
		end

		it 'retrieves an item from the database' do
			get :show, dish_id: @dish, id: @item
			expect(assigns(:item)).to eq(@item)
		end
	end

	describe 'GET #edit' do
		it 'retrieves an item from the database' do
			get :edit, dish_id: @dish, id: @item
			expect(assigns(:item)).to eq(@item)
		end

		it 'renders the edit template' do
			get :edit, dish_id: @dish, id: @item
			expect(response).to render_template(:edit)
		end
	end

	describe 'GET #new' do
		it 'renders the items/new template' do
			get :new, dish_id: @dish
			expect(response).to render_template(:new)
		end

		it 'assigns a new item' do
			get :new, dish_id: @dish
			expect(assigns(:item)).to be_a_new(Item)
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves an item in the database' do
				expect {
					post :create, dish_id: @dish, item: valid_attributes
					}.to change(Item, :count).by(1)
			end

			it 'redirects to the restaurant dish path' do
				post :create, dish_id: @dish, item: valid_attributes
				expect(response).to redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
			end
		end

		context 'with invalid attributes' do
			it 'does not save an item in the database' do
				expect {
					post :create, dish_id: @dish,
						item: invalid_attributes
					}.to_not change(Item, :count)
			end

			it 're-renders the new template' do
				post :create, dish_id: @dish, item: invalid_attributes
				expect(response).to render_template(:new) #ojo
			end
		end
	end

	describe 'PATCH #update' do
		context 'with valid attributes' do
			it 'updates an item attribute' do
				patch :update, dish_id: @dish, id: @item,
											 item: updated_attributes
				@item.reload
				expect(@item.name).to eq('Updated name')
			end

			it 'redirects to items#show' do
				patch :update, dish_id: @dish, id: @item,
											 item: updated_attributes
				expect(response).to redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
			end
		end

		context 'with invalid attributes' do
			it 'does not update an item attribute' do
				patch :update, dish_id: @dish, id: @item,
											 item: invalid_attributes
				@item.reload
				expect(@item.name).to_not eq(nil)
			end

			it 're-renders the edit template' do
				patch :update, dish_id: @dish, id: @item,
											 item: invalid_attributes
				expect(response).to render_template(:edit)
			end
		end
	end

	describe 'DELETE #destroy' do
		it 'retrieves an item from the database' do
			delete :destroy, dish_id: @dish, id: @item
			expect(assigns(:item)).to eq(@item)
		end

		it 'deletes an itemfrom the database' do
			expect {
				delete :destroy, dish_id: @dish, id: @item
				}.to change(Item, :count).by(-1)
		end

		it 'redirects to dish#show view' do
			delete :destroy, dish_id: @dish, id: @item
			expect(response).to redirect_to(restaurant_dish_path(@dish.restaurant_id, @dish))
		end
	end
end
