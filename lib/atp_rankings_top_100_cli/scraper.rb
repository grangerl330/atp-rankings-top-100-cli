class AtpRankingsTop100Cli::Scraper

  def scrape_players
    @doc = Nokogiri::HTML(URI.open("https://www.atptour.com/en/rankings/singles"))

    @doc.css("tbody tr").map do |player_tr|
      player = AtpRankingsTop100Cli::Player.new
      player.name = player_tr.css(".player-cell").text.strip
      player.points = player_tr.css(".points-cell").text.strip
      player.age = player_tr.css(".age-cell").text.strip
      player.rank = player_tr.css(".rank-cell").text.strip
      player.country = player_tr.css(".country-cell img").attr('alt')
      player.num_tourns_played = player_tr.css(".tourn-cell").text.strip
      player.bio_link = "https://www.atptour.com#{player_tr.css(".player-cell a").attr('href')}"
      player
    end
  end

end
