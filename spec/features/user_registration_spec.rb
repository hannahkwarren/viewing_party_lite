# spec/features/user_registration_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration page', type: :feature do
  it 'happy path: successful user registration in one try' do
    visit register_path
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Register')
    
    name = 'funbucket13'
    email = 'fubu@mail.com'
    password = 'test'
    
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirm Password', with: password
    
    click_button 'Register'
    # save_and_open_page
    expect(page).to have_content("Welcome, #{name}!")
    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'validates uniqueness of email field' do
    user1 = User.create!(name: 'Jeffrey Schmoe', email: 'jeffschmoe@mail.com', password: 'test123', password_confirmation: 'test123')

    visit register_path

    fill_in 'Name', with: user1.name
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: 'test123'
    fill_in 'Confirm Password', with: 'test123'

    click_button 'Register'
    expect(page).to have_content("Name has already been taken")
  end

  context 'missed form fields' do
    it 'sad --> happy path: registers user after skipped name field' do
      visit register_path

      name = 'Funny'
      email = 'fubu@mail.com'
      password = 'test'

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Confirm Password', with: password

      click_button 'Register'
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")

      fill_in 'Name', with: name
      click_button 'Register'
      expect(page).to have_content('Welcome, Funny!')
    end

    it 'sad --> happy path: registers user after skipped email field' do
      visit register_path

      fill_in 'Name', with: 'Ashley'
      fill_in 'Password', with: 'test'
      fill_in 'Confirm Password', with: 'test'

      click_button 'Register'
      expect(page).to have_content("Email can't be blank")

      fill_in 'Email', with: 'ash@mail.com'
      click_button 'Register'
      expect(page).to have_content('Welcome, Ashley!')
    end

    it 'sad --> happy path: registers user after error in password confirmation' do
      visit register_path

      fill_in 'Name', with: 'Beatrice'
      fill_in 'Email', with: 'bea@mail.com'
      fill_in 'Password', with: 'test'
      fill_in 'Confirm Password', with: 'test1'

      click_button 'Register'
      expect(page).to have_content("Password confirmation doesn't match Password")
      fill_in 'Confirm Password', with: 'test'
      click_button 'Register'
      expect(page).to have_content('Welcome, Beatrice!')
    end
  end
end
