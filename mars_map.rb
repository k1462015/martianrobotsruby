class MarsMap
	def initialize(x_max,y_max)
		@x_max = x_max
		@y_max = y_max
		@robots = []
		@scent_positions = []
	end

	def putSize
		puts "X: "+@x_max.to_s
		puts "Y: "+@y_max.to_s
	end

	def addRobot(robot)
		@robots << robot
	end
	
end
