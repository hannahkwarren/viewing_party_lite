require 'rails_helper'

RSpec.describe "User Registration page", type: :feature do 

  it "has a form to register a new user" do 
    visit '/register'

    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Register')

    fill_in 'Name', with: "Jeffrey Schmoe"
    fill_in 'Email', with: "jeffschmoe@mail.com"

    click_button "Register"

    expect(current_path).to eq(user_path(User.last.id))
  end

  it "validates uniqueness of email field" do 

    user1 = User.create!(name: "Jeffrey Schmoe", email: "jeffschmoe@mail.com")
    visit '/register'

    fill_in 'Name', with: "Jeffrey Schmoe"
    fill_in 'Email', with: "jeffschmoe@mail.com"

    click_button "Register"
   
    expect(page).to have_content("jeffschmoe@mail.com has already been taken")
  end
end
