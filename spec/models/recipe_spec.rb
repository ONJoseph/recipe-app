require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.new(name: 'ivan', email: 'ivanmvh@gmai.com', encrypted_password: 'mypassword')
    Recipe.new(name: 'hotdog', preparation_time: 1, cooking_time: 1, description: 'my hotdog recipe', public: true,
               user_id: @user.id)
  end

  before { subject.save }

  context 'User should create a user with name' do
    it 'should have a name attribute present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be "hotdog"' do
      expect(subject.name).to eq('hotdog')
    end
  end
  context 'Should have a description' do
    it 'description should be "my hotdog recipe"' do
      expect(subject.description).to eq('my hotdog recipe')
    end
  end

  context 'should be public' do
    it 'public should be true' do
      expect(subject.public).to eq(true)
    end
  end
end
