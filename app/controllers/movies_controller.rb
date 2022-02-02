require 'faraday'

class MoviesController < ApplicationController 

  def top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV['movies_api_key']
    end

    response = conn.get("discover/movie") do |request|
      request.params["api_key"] = ENV['movies_api_key']
      request.params["sort_by"] = "vote_average.desc"
    end
    data = JSON.parse(response.body, symbolize_names: true)
    movies = data[:results][0..39]
    # binding.pry
    user = User.find(params[:id])
    render "/users/#{user.id}/movies"
  end


end
