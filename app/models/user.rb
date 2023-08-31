class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations, foreign_key: 'user_id', dependent: :destroy
  has_many :spa_services, foreign_key: 'user_id', through: :reservations, dependent: :destroy

  validates_presence_of :email
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
