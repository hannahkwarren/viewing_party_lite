# spec/models/user_party_spec.rb

require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:viewing_party) }
    it { should belong_to(:user) }
  end

  it 'returns hosted user parties by user id' do
    user = User.create!(name: 'amy', email: 'amy@mail.com', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: 'ron', email: 'ron@mail.com', password: 'test123', password_confirmation: 'test123')
    party1 = ViewingParty.create!(duration: 184, when: '2023/02/07', time: '9:00pm', movie_title: 'Black Widow',  poster_path:'/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg')

    user_party_1 = UserParty.create!(user_id: user.id, viewing_party_id: party1.id, host: true)
    user_party_2 = UserParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
    
    expect(UserParty.hosting(user)).to contain_exactly(user_party_1)
  end

  it 'returns invited user parties bu user id' do
    user = User.create!(name: 'amy', email: 'amy@mail.com', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: 'ron', email: 'ron@mail.com', password: 'test123', password_confirmation: 'test123')
    party1 = ViewingParty.create!(duration: 184, when: '2023/02/07', time: '9:00pm', movie_title: 'Black Widow',  poster_path:'/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg')

    user_party_3 = UserParty.create!(user_id: user.id, viewing_party_id: party1.id, host: true)
    user_party_4 = UserParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)

    expect(UserParty.invited(user2)).to contain_exactly(user_party_4)
  end
end
