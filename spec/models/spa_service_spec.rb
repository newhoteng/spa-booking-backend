require 'rails_helper'

RSpec.describe SpaService, type: :model do
  let(:user) { User.new(username: 'John Doe', email: 'test@blog.com', password: 'password') }
  let(:spa_service) do
    SpaService.create(name: 'facials', image: 'www.google.com', description: 'helps to get rid of dead skin', price: 100, duration: 60.0,
                      is_removed: false)
  end

  before { user.save }

  it 'services should be valid' do
    expect(spa_service).to be_valid
  end

  it 'services should not be valid' do
    spa_service.name = nil
    expect(spa_service).to_not be_valid
  end

  it 'services should not be valid' do
    spa_service.image = nil
    expect(spa_service).to_not be_valid
  end

  it 'services.price should be an integer' do
    expect(spa_service.price).to be_a(BigDecimal)
  end

  it 'services.description should be a string' do
    expect(spa_service.description).to be_a(String)
  end

  it 'services.duration should be an integer' do
    expect(spa_service.duration).to be_an(Integer)
  end

  it 'services.is_removed should be an integer' do
    expect(spa_service.is_removed).to be_a(FalseClass)
  end
end
