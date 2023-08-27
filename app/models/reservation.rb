class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :spa_service

  validates :user_id, :spa_service_id, :date, :city, presence: true
  validates :city,
    :inclusion  => { :in => [ 'Accra', 'Kumasi', 'Abuja', 'London' ],
    :message    => "%{value} is not a valid location" }
end
