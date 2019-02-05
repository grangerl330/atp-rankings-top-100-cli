class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country

  @@all= []

  def initialize(name, rank, age, points, country)
    @name = name
    @rank = rank
    @age = age
    @points = points
    @country = country
    @@all << self
  end

  def self.all
    @@all
  end

end
