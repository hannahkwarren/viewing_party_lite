require 'rails_helper'

RSpec.describe "Discover movies page", type: :feature do

  it "has button for listing top-rated movies" do 
    user1 = User.create!(name: "Joe Schmoe", email: "joeschmoe@mail.com")
    visit "/users/#{user1.id}/discover"

    expect(page).to have_button("Find Top Rated Movies")
    
    click_button("Find Top Rated Movies")

    expect(current_path).to eq("/users/#{user1.id}/movies?q=top%20rated")
    
  end

  xit "has button for searching for movies by keyword" do 
    user1 = User.create!(name: "Joe Schmoe", email: "joeschmoe@mail.com")
    visit "/user/#{user1.id}/discover"

    expect(page).to have_button("Find Movies")
    


  end

end
