require 'rails_helper'

RSpec.describe 'movies results page', type: :feature do

  describe 'displays top rated movies' do

    
    scenario 'user requests top rated movies' do
      VCR.use_cassette('movie_db_discover_top_rated') do
        
        user1 = User.create!(name: 'Joe Schmoe', email: 'jschmoe1@mail.com')
        visit("/users/#{user1.id}/discover")
        click_button 'Find Top Rated Movies'

        # expect(current_path).to eq("/users/#{user1.id}/movies?q=top%20rated")
        expect(page).to have_css('.movie', count: 40)
        
        within(first('.movie')) do
          expect(page).to have_css('.original_title')
          expect(page).to have_css('.vote_average')
        end
      end
    end

  end
end
