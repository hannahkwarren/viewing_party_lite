require 'faraday'

class MoviesController < ApplicationController
  def connection
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

  def results
    @m_data = MovieFacade.details(params[:query])
    @user = User.find(params[:id])
    render '/users/movies'
  end

  def details
     @user = User.find(params[:id])
     @movie = MovieFacade.movie_data(params[:movie_id])
     @credits = MovieFacade.credits(params[:movie_id])
     @movie_reviews = MovieFacade.reviews(params[:movie_id])
    
    render '/users/details'
  end
end
