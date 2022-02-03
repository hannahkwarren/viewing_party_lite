class MovieService 

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

end
