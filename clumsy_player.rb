require_relative 'player'

# Specialize the behavior of the ClumsyPlayer so that he has a counter-balance to his clumsy ways. 
# As an upside to only getting half points for each treasure, give him an extra boost (or ten) 
# in health every time he's w00ted. To do that, initialize a clumsy player with a number 
# representing his boost factor. Every time he's w00ted, give him that number of w00ts.

class ClumsyPlayer < Player 
  attr_reader 'boost_factor'

  def initialize(name, health=100, boost_factor=1)
    super(name, health)
    @boost_factor = boost_factor 
  end
  def found_treasure(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
    super(damaged_treasure)
  end
  def w00t 
    @boost_factor.times { super }
  end
end

if __FILE__ == $0
    clumsy = ClumsyPlayer.new("klutz", 120, 8)
  
    hammer = Treasure.new(:hammer, 50)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
  
    crowbar = Treasure.new(:crowbar, 400)
    clumsy.found_treasure(crowbar)
  
    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"
end
