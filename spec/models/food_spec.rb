require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create!(name: 'ivan', email: 'ivan@gmail.com', password: '123456')
    @food = Food.create!(name: 'IvanM', measurement: 'gram', quantity: 2, price: 1, user_id: @user.id)
  end

  it 'should create a food by current user' do
    expect(@food).to be_valid
    expect(@food.user).to eq @user
  end
  it 'should have name' do
    expect(@food.name).to eq 'IvanM'
  end
  it 'should have measurment unit' do
    expect(@food.measurement).to eq 'gram'
  end
  it 'should have quantity' do
    expect(@food.quantity).to eq 2
  end
  it 'should have price' do
    expect(@food.price).to eq 1
  end
end
