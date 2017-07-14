class Rating
  attr_accessor :score, :viewer, :movie
  @@all = []

  def initialize(viewer, score, movie)
    @viewer = viewer
    @score = score
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end

end
