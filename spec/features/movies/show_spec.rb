# spec/features/movies/show_spec.rb

require 'rails_helper'

RSpec.describe 'Movie Details page', type: :feature do
  it 'has buttons to create a Viewing Party and to return to Discover' do
    user1 = User.create!(name: 'Joe Schmoe', email: 'joeschmoe@mail.com', password: 'test123', password_confirmation: 'test123')

    visit "/users/#{user1.id}/movies/497698"

    expect(page).to have_button('Discover Page')
    expect(page).to have_button('Create Viewing Party for Black Widow')
  end

  it 'Movie Details page should have movie data' do
    VCR.use_cassette('movie_db_discover_details') do
      user1 = User.create!(name: 'Joe Schmoe', email: 'joeschmoe@mail.com', password: 'test123', password_confirmation: 'test123')

      visit "/users/#{user1.id}/movies/497698"
      expect(page).to have_content('Black Widow')
      expect(page).to have_content('Vote Average: 7.5')
      expect(page).to have_content('Genre(s): Action, Adventure, Science Fiction')
      expect(page).to have_content("Summary:\nNatasha Romanoff, also known as Black Widow")
      expect(page).to have_content("Cast:\nScarlett Johansson as Natasha Romanoff / Black Widow")
      expect(page).to have_content('10 Reviews')
      expect(page).to have_content('Author: Trevfh')
      expect(page).to have_content("Author: Trevfh\nIt was okay")
    end
  end
end
