class MovieService 

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

  def self.images_conn
    Faraday.new(url: 'https://image.tmdb.org/t/p/w200/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

  def self.images(movie)
    response = conn.get("movie/#{movie.id}")

    file_path = response[:poster_path]

    image = images_conn.get(file_path)
  end

end
