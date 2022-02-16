# model: User

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

  has_secure_password

  has_many :user_parties
  has_many :viewing_parties, through: :user_parties
end
