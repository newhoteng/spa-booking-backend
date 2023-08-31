require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.new(username: 'John Doe', email: 'test@blog.com', password: 'password') }
  let(:spa_service) do
    SpaService.create(name: 'facials', image: 'www.google.com', description: 'helps to get rid of dead skin', price: 100, duration: 60,
                      is_removed: false)
  end
  let(:reserve) do
    Reservation.create(user:, spa_service:, date: Date.today, city: 'Accra')
  end

  before { user.save }

  it 'reservation should be valid' do
    expect(reserve).to be_valid
  end

  it 'reservation should not be valid' do
    reserve.city = nil
    expect(reserve).to_not be_valid
  end

  it 'reservation.date should not be valid' do
    reserve.date = nil
    expect(reserve).to_not be_valid
  end

  it 'reservation.date should be a date object' do
    expect(reserve.date).to be_a(Date)
  end

  it 'reservation.city should be a string' do
    expect(reserve.city).to be_a(String)
  end
end
