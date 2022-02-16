# spec/features/home_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home page', type: :feature do
  it 'has a link to return to the landing page' do
    visit root_path
    expect(page).to have_link('Return to home')
    expect(page).to have_content('Viewing Party')
  end

  it 'has a register user button' do
    visit root_path
    expect(page).to have_button('Register as a User')

    click_button('Register as a User')
    expect(current_path).to eq(register_path)
  end

  it 'has links to user dashboards' do
    user1 = User.create!(name: 'Joe Schmoe', email: 'jschmoe@mail.com', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: 'Jane Schmoe', email: 'janeschmoe@mail.com', password: 'test123', password_confirmation: 'test123')
    user3 = User.create!(name: 'Moe Schmoe', email: 'moeshmoe@mail.com', password: 'test123', password_confirmation: 'test123')
    visit root_path

    within('.existing-users') do
      expect(page).to have_link("#{user1.email}'s Dashboard")
      expect(page).to have_link("#{user2.email}'s Dashboard")
      expect(page).to have_link("#{user3.email}'s Dashboard")
    end

    click_link "#{user1.email}'s Dashboard"
    expect(current_path).to eq(user_path(user1))
  end
end
