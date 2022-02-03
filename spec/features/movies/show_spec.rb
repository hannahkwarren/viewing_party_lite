require 'rails_helper'

RSpec.describe "Movie Details page", type: :feature do 

  it "has buttons to create a Viewing Party and to return to Discover" do 
    user1 = User.create!(name: "Joe Schmoe", email: "joeschmoe@mail.com")
    
    visit "/users/#{user1.id}/movies/497698"
    
    expect(page).to have_button("Discover Page")
    expect(page).to have_button("Create Viewing Party for Black Widow")
  end

  it "Movie Details page should have movie data" do
    VCR.use_cassette('movie_db_discover_search') do
        
      user1 = User.create!(name: "Joe Schmoe", email: "joeschmoe@mail.com")
      
      visit "/users/#{user1.id}/movies/497698"
      
      expect(page).to have_content("Black Widow")
      expect(page).to have_content("Vote Average: 7.5")
      expect(page).to have_content("Genre(s): Action, Adventure, Science Fiction")
      expect(page).to have_content("Summary:\nNatasha Romanoff, also known as Black Widow")
    end

  end

  

end
