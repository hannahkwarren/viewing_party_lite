class Movie 

  attr_reader :original_title, :vote_average, :runtime, :genres, :overview

  def initialize(attributes)
    @id = attributes[:id]
    @original_title = attributes[:original_title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
  end
end
