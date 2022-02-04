class MovieFacade 

  def self.image(movie)
    
    json = MovieService.images(movie)
    
    @movie = json[:posters].map do |member_data|
      Movie.new(member_data)
    end
  end

end
