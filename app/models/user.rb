class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, foreign_key: 'user_id', dependent: :destroy
  has_many :spa_services, foreign_key: 'user_id', dependent: :destroy

  validates_presence_of :username, :email
end