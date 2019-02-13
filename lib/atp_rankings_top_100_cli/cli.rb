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

  def list(start_index)
    puts "Ranks #{start_index + 1} - #{start_index + 11}:"
    AtpRankingsTop100Cli::Player.all[start_index..start_index+10].each_with_index {|player, index| puts "#{index + start_index + 1}. #{player.name}"}
  end

  def list_all
    puts "Ranks 1 - 100:"
    AtpRankingsTop100Cli::Player.all.each_with_index {|player, index| puts "#{index + 1}. #{player.name}"}
  end

  def list_range
    if (1..100).include?(@range_choice_input.to_i)
      puts
      index = @range_choice_input.to_i - @range_choice_input.to_i % 10
      list(index)
      @range_checker = (index + 1..index + 10).to_a
      menu
    elsif @range_choice_input.downcase == "all"
      puts
      list_all
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
    player = AtpRankingsTop100Cli::Player.find(@menu_input.to_i)
    if @range_checker.include?(@menu_input.to_i)
      more_info(player)
      see_additional_info(player)
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
    stay_in_range_input = gets.chomp

    if stay_in_range_input.downcase == "y"
      list_range
    elsif stay_in_range_input.downcase == "n"
      start
    elsif stay_in_range_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      stay_in_range
    end
  end

  def more_info(player)
    puts
    puts "Name: #{player.name}"
    puts "Age: #{player.age}"
    puts "Country: #{player.country}"
    puts "Rank: #{player.rank}"
    puts "Points: #{player.points}"
    puts "Tournaments Played: #{player.num_tourns_played}"
  end

  def see_additional_info(player)
    puts
    puts "Would you like to see additional info on this player? [y/n]"
    see_additional_info_input = gets.chomp

    if see_additional_info_input.downcase == "y"
      puts
      puts "Additional Info:"
      puts
      puts "Turned pro: #{player.turned_pro}"
      puts "Weight: #{player.weight}"
      puts "Height: #{player.height}"
      puts "Birthplace: #{player.birthplace}"
      puts "Residence: #{player.residence}"
      puts "Plays: #{player.plays}"
      puts "Coach: #{player.coach}"
    elsif see_additional_info_input.downcase == "n"
      stay_in_range
    elsif see_additional_info_input.downcase == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      see_additional_info(player)
    end
  end

  def goodbye
    puts
    puts "Thank you for using ATP Rankings Top 100!"
    puts
    exit
  end

end
