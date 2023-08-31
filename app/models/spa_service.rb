class SpaService < ApplicationRecord
  has_many :reservations, foreign_key: 'spa_service_id', dependent: :destroy

  validates :name, :image, :description, :price, :duration, presence: true
end
