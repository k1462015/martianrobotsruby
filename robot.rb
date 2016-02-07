class Robot
	
	def initialize(x,y,orientation)
		@x = x.to_i
		@y = y.to_i
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

	def shout
		puts "I am a robot at X: "+@x.to_s+" Y: "+@y.to_s+" Facing: "+@orientation.to_s+"	"+@status.to_s
	
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
		new_pos = nil
		case @orientations.key(@orientation.to_i)
		when 'N'
			puts 'NORTH'
			new_pos =  [@x.to_i, @y.to_i + 1]
		when 'E'
			puts 'EAST'
			new_pos =  [@x.to_i + 1,@y.to_i]
		when 'S'
			puts 'SOUTH'
			new_pos =  [@x.to_i,@y.to_i - 1]
		when 'W'
			puts 'WEST'
			new_pos =  [@x.to_i - 1,@y.to_i]
		else
			new_pos =  'There was a problem'
		end
		return new_pos
	end

	def setStatus status
		@status = status
	end

	def goForward
		newPos = getForwardPos
		puts "Moving from forward "+@orientations.key(@orientation.to_i).to_s+@x.to_s+","+@y.to_s+" to "+newPos[0].to_s+","+newPos[1].to_s
		@x = newPos[0]
		@y = newPos[1]
	end

end