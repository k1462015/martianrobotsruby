require_relative 'mars_map'
require_relative 'robot'

puts "Mission Martian Robots. Please enter \"finish\" once you are ready to launch!"
userCommands = []

while (input = gets.chomp) != 'finish' do
	userCommands << input
end

puts "The map size is: "+userCommands[0]
x_max = userCommands[0].split(' ')[0]
y_max = userCommands[0].split(' ')[1]


marsmap = MarsMap.new(x_max.to_i,y_max.to_i)
puts marsmap.putSize