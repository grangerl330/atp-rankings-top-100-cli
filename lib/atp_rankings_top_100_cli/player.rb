class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points

  @@all= []

  def initialize(name, rank, age, points)
    @name = name
    @rank = rank
    @age = age
    @points = points
    @@all << self
  end

  def self.all
    @@all
  end

end
