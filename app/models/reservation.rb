class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :spa_service

  # validates :treatment, :description, :image, :duration, presence: true
end
