class Robot
	attr_accessor :status
	attr_accessor :orientation
	attr_accessor :x
	attr_accessor :y
	
	def initialize(x,y,orientation)
		@x = x.to_i
		@y = y.to_i
		@orientations = {"N"=>0,"E"=>1,"S"=>2,"W"=>3}
		@orientation = @orientations[orientation.to_s]
	end

	# Puts Robots current position and status
	def shout
		puts @x.to_s+" "+@y.to_s+" "+@orientations.key(@orientation.to_i)+"	"+@status.to_s
	end

	# Executes a turn instruction in given direction
	def turn(direction)
		case direction.upcase
		when 'R'
			@orientation = (@orientation + 1) % 4
		when 'L'
			@orientation = (@orientation - 1) % 4
		end
	end

	# Calculates position if robot moves forward
	def forward_position
		case @orientations.key(@orientation.to_i)
		when 'N'
			return  [@x.to_i, @y.to_i + 1]
		when 'E'
			return  [@x.to_i + 1,@y.to_i]
		when 'S'
			return  [@x.to_i,@y.to_i - 1]
		when 'W'
			return  [@x.to_i - 1,@y.to_i]
		else
			return  'There was a problem'
		end
	end

	# Executes a forward move
	def move_forward
		new_position = forward_position
		@x = new_position[0]
		@y = new_position[1]
	end

end