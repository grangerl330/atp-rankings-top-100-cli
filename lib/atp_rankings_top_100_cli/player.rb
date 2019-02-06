class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country, :num_tourns_played, :bio_link

  @@all= []

  def initialize(name=nil, rank=nil, age=nil, points=nil, country=nil, num_tourns_played=nil, bio_link=nil)
    @name = name
    @rank = rank
    @age = age
    @points = points
    @@all << self
  end

  def self.scrape_from_index(index)
    doc = Nokogiri::HTML(open("https://www.atptour.com/en/rankings/singles"))
    country_array = doc.css(".country-cell img").collect{|i| i['alt']}
    bio_link_array = doc.css(".player-cell a").collect{|i| "https://www.atptour.com" + i['href']}
    player = self.new
    player.name = doc.css(".player-cell")[index].text.strip
    player.points = doc.css(".points-cell")[index].text.strip
    player.age = doc.css(".age-cell")[index].text.strip
    player.country = country_array[index]
    player.rank = "#{index+1}"
    player.num_tourns_played = doc.css(".tourn-cell")[index].text.strip
    player.bio_link = bio_link_array[index]
  end

  def self.all
    @@all
  end

end
