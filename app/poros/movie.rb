class Movie
  attr_reader :original_title, :vote_average, :id, :overview, :runtime, :genres

  def initialize(attributes)
    @id = attributes[:id]
    @original_title = attributes[:original_title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]

  end
end