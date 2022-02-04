class ViewingParty < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def image_url
    "https://image.tmdb.org/t/p/w200" + self.poster_path
  end
  
end
