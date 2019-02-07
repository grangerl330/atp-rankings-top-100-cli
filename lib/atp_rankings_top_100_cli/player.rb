class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country, :num_tourns_played, :bio_link

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list(start_of_range, end_of_range)
    @@all[start_of_range..end_of_range].each_with_index {|player, index| puts "#{index + start_of_range + 1}. #{player.name}"}
  end

end
