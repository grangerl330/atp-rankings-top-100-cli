class AtpRankingsTop100Cli::Scraper

  def scrape_from_index(index)
    @doc = Nokogiri::HTML(open("https://www.atptour.com/en/rankings/singles"))
    @country_array = @doc.css(".country-cell img").collect{|i| i['alt']}
    @bio_link_array = @doc.css(".player-cell a").collect{|i| "https://www.atptour.com" + i['href']}

    player = AtpRankingsTop100Cli::Player.new
    player.name = @doc.css(".player-cell")[index].text.strip
    player.points = @doc.css(".points-cell")[index].text.strip
    player.age = @doc.css(".age-cell")[index].text.strip
    player.country = @country_array[index]
    player.rank = "#{index+1}"
    player.num_tourns_played = @doc.css(".tourn-cell")[index].text.strip
    player.bio_link = @bio_link_array[index]
  end

end
