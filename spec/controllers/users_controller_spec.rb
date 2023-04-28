require 'rails_helper'

RSpec.describe UsersController, type: :request do
  include Warden::Test::Helpers

  before do
    @first_user = User.create!(name: 'ivan', email: 'ivan@outlook.com', password: 'mypassword')
    login_as(@first_user, scope: :user)
  end

  describe 'GET #index' do
    before do
      get users_path
    end

    it '1-returns a successful response' do
      expect(response).to be_successful
    end

    it '3-displays the correct title' do
      expect(response.body).to include('User#index')
    end

    it '4-displays the correct name' do
      expect(response.body).to include('ivan')
    end
  end
end
