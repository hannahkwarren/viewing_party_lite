require 'faraday'

class MoviesController < ApplicationController

  def results
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
    
    @movie_data = []
    
    if params[:q] == "top rated"
      count = 1

      2.times do
        
        response = conn.get("discover/movie") do |request|
          request.params["api_key"] = ENV['movies_api_key']
          request.params["primary_release_date.gte"] = "2021-06-01"
          request.params["vote_count.gte"] = "1000"
          request.params["sort_by"] = "vote_average.desc"
          request.params["page"] = count
        end

        count += 1
        data = JSON.parse(response.body, symbolize_names: true)
        @movie_data << data
      end
    else
      response = conn.get("search/movie") do |request|
        request.params["api_key"] = ENV['movies_api_key']
        request.params["query"] = params[:query]
        request.params["page"] = 1
      end
      
      data = JSON.parse(response.body, symbolize_names: true)
      @movie_data << data
    end

    @user = User.find(params[:id])
    
    render "/users/movies"
  end
end
