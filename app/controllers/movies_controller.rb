class MoviesController < ApplicationController 

  def top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["x-api-key"] = ENV['movies_api_key']
      # faraday.headers["access_token"] = ENV['movies_access_token']
      faraday.headers["sort_by"] = "vote_average.desc"
    end
    response = conn.get("/3/discover/movie")

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    members = data[:results][0][:members]

    found_members = members.find_all {|m| m[:last_name] == params[:search]}
    @member = found_members.first
    render "welcome/index"
  end


end
