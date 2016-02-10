require_relative 'mars_map'
require_relative 'robot'

# First collect user input
puts "Mission Martian Robots. Please enter \"finish\" once you are ready to launch!"
# user_commands = ["5 3","1 1 E","RFRFRFRF","3 2 N","FRRFLLFFRRFLL","0 3 W","LLFFFLFLFL"]
user_commands = []
while (input = gets.chomp) != 'finish' do
	user_commands << input.upcase if input != ''
end

# First line of input should be map coordinate
x_max = user_commands[0].split(' ')[0]
y_max = user_commands[0].split(' ')[1]

# Create new mars map based on coordinates
marsmap = MarsMap.new(x_max.to_i,y_max.to_i)

i = 1
while i < user_commands.length do
  # Create a robot based on initial coordinates provided
  robot_pos = user_commands[i].split(' ')
  robot = Robot.new(robot_pos[0],robot_pos[1],robot_pos[2])
  # Extract instructions from next line
  instructions = user_commands[i + 1].delete(' ').split('')
  # Add to MarsMap, which also executes instructions
  marsmap.add_robot(robot,instructions)
  i += 2
end

# Puts status of all robots
marsmap.all_robots
