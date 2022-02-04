class MovieFacade

  def self.details(query)
    json = MovieService.details(query)

    @m_details = json.map do |movie|
      movie[:results].map do |m|
        Movie.new(m)
      end
    end.flatten
  end

  def self.movie_data(movie_id)
    parsed = MovieService.movie_data(movie_id)

    @movie_data = Movie.new(parsed)
  end

  def self.credits(movie_id)
    @movie_credits = MovieService.credits(movie_id)
  end

  def self.reviews(movie_id)
    @movie_reviews = MovieService.reviews(movie_id)
  end

end
