require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attributes = {
      original_title: 'Hey Dude',
      vote_average: '7.8'
    }
    movie = Movie.new(attributes)

    expect(movie).to be_a Movie
    expect(movie.original_title).to eq('Hey Dude')
    expect(movie.vote_average).to eq('7.8')
  end
end