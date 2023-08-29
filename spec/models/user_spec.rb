require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'John Doe', email: 'test@blog.com', password: 'password') }
  before { user.save }

  it 'user should be valid' do
    expect(user).to be_valid
  end

  it 'name should be present' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'email is nil so user should not be valid' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'bio should be present' do
    user.password = ''
    expect(user).to_not be_valid
  end
end
