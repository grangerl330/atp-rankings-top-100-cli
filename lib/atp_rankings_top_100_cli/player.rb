class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country, :num_tourns_played, :bio_link

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
