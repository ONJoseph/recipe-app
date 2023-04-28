require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  include Warden::Test::Helpers
  before :each do
    @first_user = User.create!(name: 'test', email: 'test@gmail.com', password: 'test12')
    login_as(@first_user, scope: :user)

    @food1 = Food.create(name: 'butter', measurement: 'lb', price: 1, quantity: 3, user: @first_user)
    @food2 = Food.create(name: 'cocoa', measurement: 'spoon', price: 1, quantity: 100, user: @first_user)
    @food3 = Food.create(name: 'egg', measurement: 'piece', price: 5, quantity: 15, user: @first_user)

    visit foods_path
    @foods_url = foods_path(@food1.id)
  end

  context 'The page should display list Foods' do
    it '1-should display the Food name' do
      expect(page).to have_content('butter')
      expect(page).to have_content('cocoa')
      expect(page).to have_content('egg')
    end
  end

  context 'The show link should redirect to the food Edit page' do
    
    context 'Test Food list should contain delete button' do
      it '4-There should contain 3 Delete button' do
        buttons = page.all(:button, 'Delete')
        expect(buttons.length).to eq(3)
      end
    end

    context 'Test Food list should contain button for new food' do
      it '5-There should contain button for adding new food' do
        expect(page).to have_content('Add Food')
      end
      it '6-New Button should redirect to correct page' do
        # new_food_link = page.all(:link, 'ADD FOOD')[0]
        # click_link(href: new_food_link['href'])
        # expect(current_path) == new_food_path
        click_link('Add Food')
        expect(page).to have_content('Add Your Food')
      end
    end
    context 'Test Delete Food' do
      it '7-There should contain button deleting food' do
        p expect(page).to have_content('Delete')
      end
      # it '8-Delete Button should redirect to correct page' do
      #  # new_food_link = page.all(:link, 'ADD FOOD')[0]
      #  # click_link(href: new_food_link['href'])
      #  # expect(current_path) == new_food_path
      #  click_link('Delete')
      #  expect(page).to have_content('Food was successfully deleted.')
      # end
    end
  end
end
