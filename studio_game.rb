require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'player'
require_relative 'game'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

loop do 
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase 
  case answer 
  when /^\d+$/ 
    knuckleheads.play(answer.to_i) 
  when 'quit', 'exit'
    knuckleheads.print_stats
    knuckleheads.save_high_scores
    break 
  else
    puts "Please enter a number or 'quit':"
  end
end
