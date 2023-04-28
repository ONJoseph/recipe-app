require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Ivan', email: 'ivan@mail.com', password: '123456')
  end

  before { subject.save }

  it 'should have name Ivan' do
    expect(subject.name).to eql('Ivan')
  end

  it 'should have name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have email present' do
    expect(subject.email).to eql('ivan@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
