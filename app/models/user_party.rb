class UserParty < ApplicationRecord 
  belongs_to :user 
  belongs_to :viewing_party

  def self.hosting(user)
    where("user_id = #{user.id} AND host = true")
  end

  def self.invited(user)
    where("user_id = #{user.id} AND host = false")
  end
end
