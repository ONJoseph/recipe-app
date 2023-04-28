require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.new(name: 'sambeck', email: 'sambeck@outlook.com', encrypted_password: 'mypassword')
    @recipe = Recipe.new(name: 'hotdog', preparation_time: 1, cooking_time: 1, description: 'my hotdog recipe',
                         public: true, user_id: @user.id)
    @food = Food.new(name: 'chilli', measurement: 'piece', price: 1, user_id: @user.id, quantity: 0)
    RecipeFood.new(food_id: @food.id, recipe_id: @recipe.id, quantity: 0)
  end

  before { subject.save }

  context 'Recipe food should created correctly' do
    it 'Quantity should be 0' do
      expect(subject.quantity).to eq(0)
    end

    it 'recipe_id should be equal to @recipe.id' do
      expect(subject.recipe_id).to eq(@recipe.id)
    end

    it 'food_id should be equal to @food.id' do
      expect(subject.food_id).to eq(@food.id)
    end
  end
end
