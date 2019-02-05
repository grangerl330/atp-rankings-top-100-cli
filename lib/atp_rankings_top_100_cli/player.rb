class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points

  @@all= []

  def initialize(name=nil, rank=nil, age=nil, points=nil)
    @name = name
    @rank = rank
    @age = age
    @points = points
    @@all << self
  end

  def self.scrape_from_index(index)
    doc = Nokogiri::HTML(open("https://www.atptour.com/en/rankings/singles"))
    player = self.new
    player.name = doc.css("td.player-cell")[index].text.strip
    player.points = doc.css("td.points-cell")[index].text.strip
    player.age = doc.css("td.age-cell")[index].text.strip
    player.rank = "#{index+1}"
  end

  def self.all
    @@all
  end

end
