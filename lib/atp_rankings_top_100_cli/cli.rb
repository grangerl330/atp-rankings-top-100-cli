class AtpRankingsTop100Cli::CLI

  def call
    puts "Welcome to ATP Rankings Top 100!"
    puts
    puts "Type exit at any time to exit the program"
    AtpRankingsTop100Cli::Scraper.new.scrape_players
    start
  end

  def start
    range_choice
    list_range
  end

  def range_choice
    puts
    puts "Which rankings range would you like to see?"
    puts
    puts "1-10"
    puts "11-20"
    puts "21-30"
    puts "31-40"
    puts "41-50"
    puts "51-60"
    puts "61-70"
    puts "71-80"
    puts "81-90"
    puts "91-100"
    puts
    @range_choice_input = gets.chomp
  end

  def list_range
    if (1..100).include?(@range_choice_input.to_i)
      puts
      case @range_choice_input.to_i
        when (1..10)
          AtpRankingsTop100Cli::Player.list(0, 9)
          @range_checker = (1..10).to_a
        when (11..20)
          AtpRankingsTop100Cli::Player.list(10, 19)
          @range_checker = (11..20).to_a
        when (21..30)
          AtpRankingsTop100Cli::Player.list(20, 29)
          @range_checker = (21..30).to_a
        when (31..40)
          AtpRankingsTop100Cli::Player.list(30, 39)
          @range_checker = (31..40).to_a
        when (41..50)
          AtpRankingsTop100Cli::Player.list(40, 49)
          @range_checker = (41..50).to_a
        when (51..60)
          AtpRankingsTop100Cli::Player.list(50, 59)
          @range_checker = (51..60).to_a
        when (61..70)
          AtpRankingsTop100Cli::Player.list(60, 69)
          @range_checker = (61..70).to_a
        when (71..80)
          AtpRankingsTop100Cli::Player.list(70, 79)
          @range_checker = (71..80).to_a
        when (81..90)
          AtpRankingsTop100Cli::Player.list(80, 89)
          @range_checker = (81..90).to_a
        when (91..100)
          AtpRankingsTop100Cli::Player.list(90, 99)
          @range_checker = (91..100).to_a
        end
      puts
      menu
    elsif @range_choice_input == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      start
    end
  end

  def menu
    puts "Enter player number for more information:"
    @menu_input = gets.chomp

    if @range_checker.include?(@menu_input.to_i)
      more_info(@menu_input.to_i)
      see_another_player
    elsif @menu_input == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      list_range
    end
  end

  def see_another_player
    puts
    puts "Would you like to see another player from this range? [y/n]"
    @see_another_player_input = gets.chomp

    if @see_another_player_input == "y"
      list_range
    elsif @see_another_player_input == "n"
      start
    elsif @see_another_player_input == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      see_another_player
    end
  end

  def more_info(input)
    puts
    puts "Name: #{AtpRankingsTop100Cli::Player.all[input-1].name}"
    puts "Age: #{AtpRankingsTop100Cli::Player.all[input-1].age}"
    puts "Country: #{AtpRankingsTop100Cli::Player.all[input-1].country}"
    puts "Rank: #{AtpRankingsTop100Cli::Player.all[input-1].rank}"
    puts "Points: #{AtpRankingsTop100Cli::Player.all[input-1].points}"
    puts "Tournaments Played: #{AtpRankingsTop100Cli::Player.all[input-1].num_tourns_played}"
    puts "Bio Link: #{AtpRankingsTop100Cli::Player.all[input-1].bio_link}"
  end

  def goodbye
    puts
    puts "Thank you for using ATP Rankings Top 100!"
    exit
  end

end
