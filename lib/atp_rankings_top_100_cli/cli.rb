class AtpRankingsTop100Cli::CLI

  def call
    puts "Welcome to ATP Rankings Top 100!"
    create_players
    puts
    start
  end

  def create_players
    100.times do |i|
      AtpRankingsTop100Cli::Player.scrape_from_index(i)
    end
  end

  def start
    range_choice
    if @@input > 0
      puts
      list_range(@@input)
      puts
      menu
    else
      puts "Invalid Input"
      start
    end
  end

  def range_choice
    puts "Which range would you like to see?"
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
    @@input = gets.strip.to_i
  end

  def list_range(input)
    if (1..10).include?(input)
      AtpRankingsTop100Cli::Player.all[0..9].each_with_index {|player, index| puts "#{index+1}. #{player.name}"}
    elsif (11..20).include?(input)
      AtpRankingsTop100Cli::Player.all[10..19].each_with_index {|player, index| puts "#{index+11}. #{player.name}"}
    elsif (21..30).include?(input)
      AtpRankingsTop100Cli::Player.all[20..29].each_with_index {|player, index| puts "#{index+21}. #{player.name}"}
    elsif (31..40).include?(input)
      AtpRankingsTop100Cli::Player.all[30..39].each_with_index {|player, index| puts "#{index+31}. #{player.name}"}
    elsif (41..50).include?(input)
      AtpRankingsTop100Cli::Player.all[40..49].each_with_index {|player, index| puts "#{index+41}. #{player.name}"}
    elsif (51..60).include?(input)
      AtpRankingsTop100Cli::Player.all[50..59].each_with_index {|player, index| puts "#{index+51}. #{player.name}"}
    elsif (61..70).include?(input)
      AtpRankingsTop100Cli::Player.all[60..69].each_with_index {|player, index| puts "#{index+61}. #{player.name}"}
    elsif (71..80).include?(input)
      AtpRankingsTop100Cli::Player.all[70..79].each_with_index {|player, index| puts "#{index+71}. #{player.name}"}
    elsif (81..90).include?(input)
      AtpRankingsTop100Cli::Player.all[80..89].each_with_index {|player, index| puts "#{index+81}. #{player.name}"}
    elsif (91..100).include?(input)
      AtpRankingsTop100Cli::Player.all[90..99].each_with_index {|player, index| puts "#{index+91}. #{player.name}"}
    end
  end

  def menu
    puts "Enter player name or number for more information:"
  end

end
