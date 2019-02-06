class AtpRankingsTop100Cli::Scraper

  def scrape_players
    @doc = Nokogiri::HTML(open("https://www.atptour.com/en/rankings/singles"))

    @doc.search("tbody tr").each do |player_tr|
      player = AtpRankingsTop100Cli::Player.new
      player.name = player_tr.search(".player-cell").text.strip
      player.points = player_tr.search(".points-cell").text.strip
      player.age = player_tr.search(".age-cell").text.strip
      player.rank = player_tr.search(".rank-cell").text.strip
      player.country = player_tr.search(".country-cell img").attr('alt')
      player.num_tourns_played = player_tr.search(".tourn-cell").text.strip
      player.bio_link = "https://www.atptour.com#{player_tr.search(".player-cell a").attr('href')}"
    end
  end

end
