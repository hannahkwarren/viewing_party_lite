require 'rails_helper'

RSpec.describe "User Dashboard Page", type: :feature do 

  it "should have the user name in heading + button to go to the discover movies page" do 
    
    user1 = User.create!(name: "Joe Schmoe", email: "joeschmoe@mail.com")

    visit user_path(user1)

    expect(page).to have_content("#{user1.name}'s Dashboard")
  
    within ".movie-discovery" do 
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"
    end

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

end
