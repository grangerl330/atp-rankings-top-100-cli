class AtpRankingsTop100Cli::Player
  attr_accessor :name, :rank, :age, :points, :country, :num_tourns_played, :bio_link, :turned_pro, :weight, :height, :birthplace, :residence, :plays, :coach

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.bio_link))
  end

  def turned_pro
    @turned_pro = doc.css(".table-big-value")[1].text.strip
  end

  def weight
    @weight ||= doc.css(".table-big-value")[2].text.strip
  end

  def height
    @height ||= doc.css(".table-big-value")[3].text.strip
  end

  def birthplace
    @birthplace ||= doc.css(".table-value")[0].text.strip
  end

  def residence
    @residence ||= doc.css(".table-value")[1].text.strip
  end

  def plays
    @plays ||= doc.css(".table-value")[2].text.strip
  end

  def coach
    @coach ||= doc.css(".table-value")[3].text.strip
  end

end
