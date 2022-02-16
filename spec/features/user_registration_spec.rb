# spec/features/user_registration_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration page', type: :feature do
  it 'has a form to register a new user' do
    visit '/register'

    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Register')

    name = 'funbucket13'
    email = 'fubu@mail.com'
    password = 'test'

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button 'Register'
    expect(page).to have_content("Welcome, #{name}!")
    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'validates uniqueness of email field' do
    user1 = User.create!(name: 'Jeffrey Schmoe', email: 'jeffschmoe@mail.com', password: 'test123', password_confirmation: 'test123')
    visit '/register'

    fill_in 'Name', with: user1.name
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: 'test123'
    fill_in 'Confirm Password', with: 'test123'

    click_button 'Register'
    expect(page).to have_content("jeffschmoe@mail.com has already been taken")
  end
end
