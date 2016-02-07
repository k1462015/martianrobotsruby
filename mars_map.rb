class MarsMap
	def initialize(x_max,y_max)
		@x_max = x_max.to_i
		@y_max = y_max.to_i
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

	def addScentPos (x,y)
		@scent_positions << [x.to_i,y.to_i]
	end

	def isScentPosition (x,y)
		@scent_positions.include? [x.to_i,y.to_i]
	end	

	def isOffPos(x,y)
		x = x.to_i
		y = y.to_i

		if x > @x_max || x < 0 || y > @y_max || y < 0
			return true
		else
			return false
		end
	end
end
