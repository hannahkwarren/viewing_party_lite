class User < ApplicationRecord
  validates :email, uniqueness: true
  
  has_many :invitees
  has_many :viewing_parties, through: :invitees
end
