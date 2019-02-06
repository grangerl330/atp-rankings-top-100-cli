class AtpRankingsTop100Cli::CLI

  def call
    puts "Welcome to ATP Rankings Top 100!"
    puts
    puts "Type exit at any time to exit the program"
    puts
    puts "Please wait while the list loads..."
    create_players
    start
  end

  def create_players
    100.times do |i|
      AtpRankingsTop100Cli::Player.scrape_from_index(i)
    end
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
    @rc_input = gets.chomp
  end

  def list_range
    if (1..100).include?(@rc_input.to_i)
      puts
      if (1..10).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[0..9].each_with_index {|player, index| puts "#{index+1}. #{player.name}"}
        @range_checker = (1..10).to_a
      elsif (11..20).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[10..19].each_with_index {|player, index| puts "#{index+11}. #{player.name}"}
        @range_checker = (11..20).to_a
      elsif (21..30).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[20..29].each_with_index {|player, index| puts "#{index+21}. #{player.name}"}
        @range_checker = (21..30).to_a
      elsif (31..40).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[30..39].each_with_index {|player, index| puts "#{index+31}. #{player.name}"}
        @range_checker = (31..40).to_a
      elsif (41..50).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[40..49].each_with_index {|player, index| puts "#{index+41}. #{player.name}"}
        @range_checker = (41..50).to_a
      elsif (51..60).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[50..59].each_with_index {|player, index| puts "#{index+51}. #{player.name}"}
        @range_checker = (51..60).to_a
      elsif (61..70).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[60..69].each_with_index {|player, index| puts "#{index+61}. #{player.name}"}
        @range_checker = (61..70).to_a
      elsif (71..80).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[70..79].each_with_index {|player, index| puts "#{index+71}. #{player.name}"}
        @range_checker = (71..80).to_a
      elsif (81..90).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[80..89].each_with_index {|player, index| puts "#{index+81}. #{player.name}"}
        @range_checker = (81..90).to_a
      elsif (91..100).include?(@rc_input.to_i)
        AtpRankingsTop100Cli::Player.all[90..99].each_with_index {|player, index| puts "#{index+91}. #{player.name}"}
        @range_checker = (91..100).to_a
      end
      puts
      menu
    elsif @rc_input == "exit"
      goodbye
    else
      puts
      puts "Invalid Input"
      puts
      start
    end
  end

  def menu
    puts "Enter player number for more information:"
    @menu_input_1 = gets.chomp
    if @range_checker.include?(@menu_input_1.to_i)
      more_info(@menu_input_1.to_i)
      see_another_player
    elsif @menu_input_1 == "exit"
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
    @sap_input = gets.chomp
    if @sap_input == "y"
      list_range
    elsif @sap_input == "n"
      start
    elsif @sap_input == "exit"
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
