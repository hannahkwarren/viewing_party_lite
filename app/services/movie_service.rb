class MovieService 

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
    end
  end

  def self.details(query)
    movies_data = []

    if query == 'top rated'

      count = 1

      2.times do
        response = connection.get('discover/movie') do |request|
          request.params['api_key'] = ENV['movies_api_key']
          request.params['primary_release_date.gte'] = '2021-06-01'
          request.params['vote_count.gte'] = '1000'
          request.params['sort_by'] = 'vote_average.desc'
          request.params['page'] = count
        end
        
        count += 1
        data = JSON.parse(response.body, symbolize_names: true)
        movies_data << data
      end
    else
      response = connection.get('search/movie') do |request|
        request.params['api_key'] = ENV['movies_api_key']
        request.params['query'] = query
        request.params['page'] = 1
      end

      data = JSON.parse(response.body, symbolize_names: true)
      movies_data << data
    end
    
    movies_data
  end

  def self.movie_data(movie_id)
    data = connection.get("movie/#{movie_id}") do |request|
      request.params['api_key'] = ENV['movies_api_key']
    end
    
    JSON.parse(data.body, symbolize_names: true)    
  end

  def self.credits(movie_id)
    credits = connection.get("movie/#{movie_id}/credits") do |request|
      request.params['api_key'] = ENV['movies_api_key']
    end
    
    all = JSON.parse(credits.body, symbolize_names: true)

    all[:cast][0..9]
  end

  def self.reviews(movie_id)
    reviews = connection.get("movie/#{movie_id}/reviews") do |request|
      request.params['api_key'] = ENV['movies_api_key']
    end

    JSON.parse(reviews.body, symbolize_names: true)
  end

end
