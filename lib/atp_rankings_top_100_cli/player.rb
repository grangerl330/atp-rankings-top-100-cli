class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country

  @@all= []

  def initialize(name=nil, rank=nil, age=nil, points=nil, country=nil)
    @name = name
    @rank = rank
    @age = age
    @points = points
    @@all << self
  end

  def self.scrape_from_index(index)
    doc = Nokogiri::HTML(open("https://www.atptour.com/en/rankings/singles"))
    country_array = doc.css('.country-cell img').collect{ |i| i['alt'] }
    player = self.new
    player.name = doc.css("td.player-cell")[index].text.strip
    player.points = doc.css("td.points-cell")[index].text.strip
    player.age = doc.css("td.age-cell")[index].text.strip
    player.country = country_array[index]
    player.rank = "#{index+1}"
  end

  def self.all
    @@all
  end

end
