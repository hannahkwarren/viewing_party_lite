class ViewingPartyController < ApplicationController 

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end
  
  def new 
    response = conn.get("movie/#{params[:movie_id]}") do |request|
      request.params['api_key'] = ENV['movies_api_key']
    end

    @movie = JSON.parse(response.body, symbolize_names: true)
    
    @users = User.where.not(id: params[:id])
  end

  def create 
    response = conn.get("movie/#{params[:movie_id]}") do |request|
      request.params['api_key'] = ENV['movies_api_key']
    end

    @movie = JSON.parse(response.body, symbolize_names: true)

    user = User.find(params[:id])
   binding.pry
    @viewing_party = ViewingParty.new(party_params)

    #for every invitee in params
    #do viewing_party.invitee.create!(params[invitee.id])

    if @viewing_party.save
      flash[:success] = "Party created!"
      redirect_to "/user/#{user.id}/dashboard"
    else
      flash[:alert] = "Could not create party, please try again."
      redirect_to "/users/#{user1.id}/movies/497698/viewing-party/new"
    end
  end

  private 
  def party_params
    params.permit(:duration, :when, :start_time, :invitees)
  end
end
