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
