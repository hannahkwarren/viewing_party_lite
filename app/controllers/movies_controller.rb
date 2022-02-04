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
    # response = connection.get("movie/#{params[:movie_id]}") do |request|
    #   request.params['api_key'] = ENV['movies_api_key']
    # end
    # response2 = connection.get("movie/#{params[:movie_id]}/credits") do |request|
    #   request.params['api_key'] = ENV['movies_api_key']
    # end
    # response3 = connection.get("movie/#{params[:movie_id]}/reviews") do |request|
    #   request.params['api_key'] = ENV['movies_api_key']
    # end

    # @user = User.find(params[:id])
    # @movie = JSON.parse(response.body, symbolize_names: true)
    # @movie_credits = JSON.parse(response2.body, symbolize_names: true)
    # @movie_reviews = JSON.parse(response3.body, symbolize_names: true)

    render '/users/details'
  end
end
