class SpaService < ApplicationRecord
  has_many :reservations, foreign_key: 'spa_service_id', dependent: :destroy
  belongs_to :user
  validates :name, :image, :description, :price, presence: true
end
