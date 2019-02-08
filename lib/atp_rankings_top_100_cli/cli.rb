class AtpRankingsTop100Cli::CLI

  def call
    puts
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
    puts "Rankings Ranges:"
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
    puts "Type a number in the range you would like to see or type all to see all 100 players"
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
      menu
    elsif @range_choice_input.downcase == "all"
      puts
      AtpRankingsTop100Cli::Player.list(0, 99)
      @range_checker = (1..100).to_a
      menu
    elsif @range_choice_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      start
    end
  end

  def menu
    puts
    puts "Enter player number for more information:"
    @menu_input = gets.chomp
    @player = AtpRankingsTop100Cli::Player.find(@menu_input.to_i)

    if @range_checker.include?(@menu_input.to_i)
      more_info
      see_additional_info(@player)
      stay_in_range
    elsif @menu_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      list_range
    end
  end

  def stay_in_range
    puts
    puts "Would you like to stay in this rankings range? [y/n]"
    @stay_in_range_input = gets.chomp

    if @stay_in_range_input.downcase == "y"
      list_range
    elsif @stay_in_range_input.downcase == "n"
      start
    elsif @stay_in_range_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      stay_in_range
    end
  end

  def more_info
    puts
    puts "Name: #{@player.name}"
    puts "Age: #{@player.age}"
    puts "Country: #{@player.country}"
    puts "Rank: #{@player.rank}"
    puts "Points: #{@player.points}"
    puts "Tournaments Played: #{@player.num_tourns_played}"
  end

  def see_additional_info(player)
    puts
    puts "Would you like to see additional info on this player? [y/n]"
    @see_additional_info_input = gets.chomp

    if @see_additional_info_input.downcase == "y"
      puts
      puts "Additional Info:"
      puts
      puts "Turned pro: #{@player.turned_pro}"
      puts "Weight: #{@player.weight}"
      puts "Height: #{@player.height}"
      puts "Birthplace: #{@player.birthplace}"
      puts "Residence: #{@player.residence}"
      puts "Plays: #{@player.plays}"
      puts "Coach: #{@player.coach}"
    elsif @see_additional_info_input.downcase == "n"
      stay_in_range
    elsif @see_additional_info_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      see_additional_info(@player)
    end
  end

  def goodbye
    puts
    puts "Thank you for using ATP Rankings Top 100!"
    puts
    exit
  end

end
