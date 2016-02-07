class Robot
	
	def initialize(x,y,orientation)
		@x = x
		@y = y
		@orientations = {
			"N"=>0,
			"E"=>1,
			"S"=>2,
			"W"=>3
		}
		@orientation = @orientations[orientation.to_s]
		@status = 'Alive'
	end


	def getPos
		puts "X: "+@x.to_s
		puts "Y: "+@y.to_s
	end

	def turn direction
		puts "Current Direction: "+@orientations.key(@orientation.to_i)
		case direction.downcase
		when 'r'
			@orientation = (@orientation + 1) % 4
		when 'l'
			@orientation = (@orientation - 1) % 4
			if @orientation < 0 then 
				@orientation = 3 
			end
		end
		puts "New Direction: "+@orientations.key(@orientation.to_i)
	end


	def getForwardPos
		case @orientations.key(@orientation.to_i)
		when 'N'
			return [@x.to_i,@y.to_i + 1]
		when 'E'
			return [@x.to_i + 1,@y.to_i]
		when 'S'
			return [@x.to_i + 1,@y.to_i - 1]
		when 'W'
			return [@x.to_i - 1,@y.to_i]
		else
			puts 'There was a problem'
		end
	end

	def setStatus status
		@status = status
	end

	def goForward
		newPos = getForwardPos
		@x = newPos[0]
		@y = newPos[1]
	end

end