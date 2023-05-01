require 'rails_helper'

RSpec.describe FoodsController, type: :request do
  include Warden::Test::Helpers
  before do
    @first_user = User.create!(name: 'ivan', email: 'ivan@outlook.com', password: 'mypassword')
    login_as(@first_user, scope: :user)
    @food = Food.create!(name: 'tomato', measurement: 'piece', price: 4, quantity: 15, user_id: @first_user.id)
  end
  describe 'GET #index' do
    before do
      get foods_path
    end
    it '1-should displays the index template' do
      expect(response).to render_template(:index)
     end
    it '2-should displays the correct title' do
      expect(response.body).to include('Foods')
    end
    it '3-should displays the foods name' do
      expect(response.body).to include('tomato')
    end
  end
  describe 'GET #new' do
    before do
      get new_food_path
    end
    it '4-should displays the correct template' do
      expect(response).to render_template(:new)
     end
    it '5-returns a successful response' do
      expect(response).to be_successful
    end
    it '6-displays the correct title' do
      expect(response.body).to include('Add Your Food')
    end
    it '7-displays the correct tags' do
      expect(response.body).to include('Name')
      expect(response.body).to include('Measurement')
      expect(response.body).to include('Price')
      expect(response.body).to include('Quantity')
      expect(response.body).to include('Add Your Food') && include('Add Food')
    end
  end

  describe 'DELETE #destroy' do
    before do
      delete food_path(@food)
    end
    it '8-should returns a successful response' do
      expect(response).to redirect_to(:root)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Food was successfully deleted.')
    end
  end
end
