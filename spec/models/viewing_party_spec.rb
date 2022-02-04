require 'rails_helper'

RSpec.describe ViewingParty, type: :model do 

  it { should have_many(:user_parties) }
  it { should have_many(:users).through(:user_parties) }

  describe 'instance methods' do 

    it 'can create an image path url' do 
      party1 = ViewingParty.create!(duration: 184, when: "2023/02/07", time: "9:00pm", movie_title: "Black Widow",  poster_path:"/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")

      expect(party1.image_url).to eq("https://image.tmdb.org/t/p/w200/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")
    end


  end

end
