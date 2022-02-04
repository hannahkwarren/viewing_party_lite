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

    params[:user_ids].each do |id|
      @viewing_party.user_parties.create(user_id: id.to_i)
      @viewing_party.movie_title = @movie[:original_title]
      @viewing_party.user_parties.create(user_id: id.to_i, host: true)
    end
    
    if @viewing_party.save
      flash[:success] = "Party created!"
      redirect_to user_path(user)
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

