require 'pry'
class Movie
  attr_accessor :title
  @@all = []
  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find{|movie| movie.title == title}
  end

  def ratings
    Rating.all.select{|film| film.movie == self.title}
  end

  def viewers
    # Rating.all.select{|film| film.movie == self.title}
    answer = Rating.all.select{|film| film.movie == self.title}
    answer.each do |x|
      x.viewer
    end
  end

  def average_rating
    m = Rating.all.select{|rating| rating.movie == self.title}
    m.each{|x|x.score}.inject(0, :+)
    # binding.pry
    # divisor = array.length
    # sum/divisor
  end
end


class Viewer
  attr_accessor :first_name, :last_name
  @@all = []
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(full_name)
    self.all.find {|viewer| viewer.full_name == full_name}
  end

  def create_rating(score, movie)
    Rating.new(self, score, movie)

  end
  def full_name
    "#{first_name} #{last_name}"
  end

end
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
# Please copy/paste all three classes into this file to submit your solution!
