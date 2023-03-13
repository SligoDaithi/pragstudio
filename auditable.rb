require_relative 'die'
#require_relative 'loaded_die'

module Auditable
  def audit 
    puts "Rolled a #{self.number} (#{self.class})"
  end
end
