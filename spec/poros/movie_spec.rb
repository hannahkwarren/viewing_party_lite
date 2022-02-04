require 'rails_helper'

RSpec.describe Movie do

  it 'exists' do
    attributes = {
      id: 739452,
      original_title: 'Hey Dude',
      vote_average: '7.8', 
      overview: "A 90s show made into a movie.",
      runtime: 98, 
      genres: [{
        "id": 28,
        "name": "Action"
      },
      {
        "id": 12,
        "name": "Adventure"
      },
      {
        "id": 878,
        "name": "Science Fiction"
      }], 
      poster_path: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg"
    }
    movie = Movie.new(attributes)

    expect(movie).to be_a Movie
    expect(movie.original_title).to eq('Hey Dude')
    expect(movie.vote_average).to eq('7.8')
    expect(movie.overview).to eq("A 90s show made into a movie.")
    expect(movie.runtime).to eq(98)
    expect(movie.genres).to be_an Array
    expect(movie.genres.first).to be_a Hash
    expect(movie.poster).to eq("/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")
  end
end
