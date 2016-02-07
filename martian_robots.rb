require_relative 'mars_map'
require_relative 'robot'

# First collect user input
puts "Mission Martian Robots. Please enter \"finish\" once you are ready to launch!"
userCommands = []

while (input = gets.chomp) != 'finish' do
	userCommands << input
end

# First line of input should be map coordinate
puts "The map size is: "+userCommands[0]
x_max = userCommands[0].split(' ')[0]
y_max = userCommands[0].split(' ')[1]


marsmap = MarsMap.new(x_max.to_i,y_max.to_i)
marsmap.addScentPos(1,2)
marsmap.addScentPos(2,4)

# Test
puts "Is off map" if marsmap.isOffPos(10,10)

# Test
puts "In scent pos" if marsmap.isScentPosition(2,4)

puts marsmap.putSize


# Now Process Robot position and commands
robot = Robot.new(1,1,'N')
robot.goForward
robot.getPos
puts "Turning left from N"
robot.turn('l')