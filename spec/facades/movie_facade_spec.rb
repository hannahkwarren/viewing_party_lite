# spec/facades/movie_facade_spec.rb

require 'rails_helper'

RSpec.describe MovieFacade do
  it '.details - top rated' do
    deets = MovieFacade.details('top rated')
    
    expect(deets).to be_an Array
    expect(deets.first).to be_a Movie
  end

  it '.details - query' do
    deets = MovieFacade.details('start')

    expect(deets).to be_an Array
    expect(deets.first).to be_a Movie
  end
end
