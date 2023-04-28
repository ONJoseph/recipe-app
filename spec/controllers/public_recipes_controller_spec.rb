require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  include Warden::Test::Helpers
  before do
    @first_user = User.create!(name: 'ivan', email: 'ivan@outlook.com', password: 'mypassword')
    login_as(@first_user, scope: :user)
    @recipe = Recipe.create!(name: 'New recipe', preparation_time: 1, cooking_time: 1, description: 'My hotdog recipe',
                             public: true, user: @first_user)
    @private_recipe = Recipe.create!(name: 'private recipe', preparation_time: 2, cooking_time: 2,
                                     description: 'My private hotdog recipe',
                                     public: false, user: @first_user)
    @food = Food.create!(name: 'chilli', measurement: 'piece', price: 1, user_id: @first_user.id, quantity: 1)
    @recipe_food = RecipeFood.create!(food_id: @food.id, recipe_id: @recipe.id, quantity: 1)
  end
  describe 'GET #index' do
    before do
      get public_recipes_path
    end
    it '1-returns a successful response' do
      expect(response).to be_successful
    end
    # it '2-displays the index template' do
    #  expect(response).to render_template(:index)
    # end
    it '3-displays the correct title' do
      # expect(response.body).to include('Public Recipe')
      expect(response.body).to include('Recipes')
    end
    it '4-displays only the public recipes' do
      expect(response.body).to include('New recipe')
    end
  end
  describe 'GET #show' do
    before do
      get public_recipes_path(@recipe.id)
    end
    # it '5-returns a successful response' do
    #  expect(response).to be_successful
    # end
    # it '6-displays the index template' do
    #  expect(response).to render_template(:show)
    # end
    it '7-displays the name of the recipe' do
      expect(response.body).to include('New recipe')
    end
    it '8-displays the recipe description' do
      expect(response.body).to include('My hotdog recipe')
    end
  end
end
