require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Warden::Test::Helpers
  before :each do
    @first_user = User.create!(name: 'ivan', email: 'ivan@outlook.com', password: 'mypassword')
    login_as(@first_user, scope: :user)
    @recipe = Recipe.create!(name: 'My new recipe', preparation_time: 1, cooking_time: 1,
                             description: 'My hotdog recipe', public: true, user: @first_user)
    @recipe2 = Recipe.create!(name: 'My last recipe', preparation_time: 2, cooking_time: 3,
                              description: 'My delicious last recipe', public: true, user: @first_user)

    visit recipes_path
    @recipe1_url = "#{recipes_path}/#{@recipe.id}"
    @recipe2_url = "#{recipes_path}/#{@recipe2.id}"
    @form_url = "#{recipes_path}/new"
  end

  context 'The page should display the recipes' do
    it '1-should display the recipe description' do
      expect(page).to have_content('My hotdog recipe')
    end
  end

  context 'The recipes should be ordered from the last recipe created' do
    it '2-The first recipe showed should be "My last recipe"' do
      expect(page.find('.recipe-listing:eq(1)')).to have_content('My last recipe')
    end

    it '3-The second recipe showed should be "My new recipe"' do
      expect(page.find('.recipe-listing:eq(2)')).to have_content('My new recipe')
    end
  end

  context 'The show link should redirect to the recipe details page' do
    it '4-When I click on the first Show this recipe, I am redirected to the first recipe details page' do
      first_link = page.all(:link, 'Recipes')[0] # Obtener el primer link
      click_link(href: first_link['href'])
      expect(current_path) == @recipe1_url
    end
  end

  context 'Test the New Recipe button' do
    it '6-The New Recipe button should redirect to the add recipe form' do
      click_link 'New recipe'
      expect(current_path) == @form_url
    end
  end

  context 'Test Delete button' do
    it '7-The first Delete button should delete the first recipe from the page' do
      first('.delete-button').click
      expect(page).not_to have_content('My last recipe')
    end
  end

  describe 'Recipe' do
    before :each do
      visit "#{recipes_path}/#{@recipe2.id}"
      @add_ingredient_url = "#{recipes_path}/#{@recipe2.id}/recipe_foods"
    end

    context 'The details page should be desplayed' do
      it '8-should display the name of the recipe "My delicious last recipe"' do
        expect(page).to have_content('My delicious last recipe')
      end

      it '9-should display the preparation_time of the recipe' do
        expect(page).to have_content('Preparation Time:')
        expect(page).to have_content('2')
      end
    end

    context 'Test the public/private button' do
      it '10-The public state should be true' do
        expect(@recipe2.public).to eq(true)
      end

      it '11-The name of the button should be Public, not Private' do
        expect(page).to have_content('Public')
      end

      it '12-The public state should change when I click on the Public button' do
        page.check('public-switch')
        expect(@recipe2.public) == (false)
      end
    end
  end
end
