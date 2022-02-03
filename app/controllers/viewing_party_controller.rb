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
   
    @viewing_party = ViewingParty.create(party_params)

    params[:invitees].each do |invitee|
      binding.pry
      @viewing_party.invitees.create!(user_id: invitee.to_i)

      @viewing_party.invitees.create(user_id: user.id, host: true)
    end

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
    params.permit(:duration, :when, :time)
  end
end
# , :invitees => []
