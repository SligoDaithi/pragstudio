def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end
#conversation { puts "Nice to meet you!" }
def n_times(number) 
    1.upto(number) do |count|
      yield count 
    end
end
n_times(5) do |n|
    puts "#{n} situps"
    puts "#{n} pushups"
    puts "#{n} chinups"
end
