require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  include Warden::Test::Helpers

  before do
    @first_user = User.create!(name: 'ivan', email: 'ivan@outlook.com', password: 'mypassword')
    login_as(@first_user, scope: :user)
    @recipe = Recipe.create!(name: 'New recipe', preparation_time: 1, cooking_time: 1, description: 'My hotdog recipe',
                             public: true, user: @first_user)
  end

  describe 'GET #index' do
    before do
      get recipes_path
    end

    it '1-returns a successful response' do
      expect(response).to be_successful
    end

    it '2-ok-displays the index template' do
      expect(response).to render_template(:index)
    end

    it '3-displays the correct recipe name' do
      expect(response.body).to include('New recipe')
      expect(response.body).to include('My hotdog recipe')
    end

    it '4-displays the correct recipe description' do
      expect(response.body).to include('My hotdog recipe')
    end
  end

  describe 'GET #show' do
    before do
      get recipe_path(@recipe.id)
    end

    it '5-ok-displays the correct template' do
      expect(response).to render_template(:show)
    end

    it '6-returns a successful response' do
      expect(response).to be_successful
    end

    it '7-displays the correct recipe description' do
      expect(response.body).to include('My hotdog recipe')
    end

    it '8-displays all buttons' do
      expect(response.body).to include('General Shopping List')
      expect(response.body).to include('Add Ingredient')
    end
  end

  describe 'GET #new' do
    before do
      get new_recipe_path
    end

    it '9-ok-displays the correct template' do
      expect(response).to render_template(:new)
    end

    it '10-returns a successful response' do
      expect(response).to be_successful
    end

    it '11-displays the correct title' do
      expect(response.body).to include('Welcome little')
      expect(response.body).to include('please add your recipe')
    end

    it '12-displays the correct tags' do
      expect(response.body).to include('title')
      expect(response.body).to include('Preparation time')
      expect(response.body).to include('Cooking time')
      expect(response.body).to include('Description')
      expect(response.body).to include('Public')
    end

    it '13-displays all buttons' do
      expect(response.body).to include('Add')
    end
  end

  describe 'DELETE #destroy' do
    before do
      delete recipe_path(@recipe)
    end

    it '14-returns a successful response' do
      expect(response).to redirect_to(recipes_url)
    end
    it '15-should display the message "Recipe was deleted successfully."' do
      expect(flash[:notice]).to eq('Recipe was deleted successfully.')
    end
  end
end
