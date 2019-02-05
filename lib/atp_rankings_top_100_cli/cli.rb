class AtpRankingsTop100Cli::CLI

  def call
    puts "Welcome to ATP Rankings Top 100!"
    start
  end

  def start
    range_choice
    if @@input > 0
      range_choice
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

end
