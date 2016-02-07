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

	def addRobot(robot,commands)
		scents_to_add = []
		commands.each do |command|
			if command == 'R' || command == 'L'
				then robot.turn(command)
			else
				# Check if forward pos in scent pos
				forward_pos = robot.getForwardPos
				unless isScentPosition(forward_pos[0],forward_pos[1])
					if isOffPos(forward_pos[0],forward_pos[1]) then
						puts "Is scent position: "+forward_pos[0].to_s+forward_pos[1].to_s
						scents_to_add << [forward_pos[0],forward_pos[1]]
						robot.setStatus('LOST')
					end
					robot.goForward
				end
			end
		end

		scents_to_add.each do |scent|
			addScentPos(scent[0],scent[1])
		end

		puts "Adding Robot"
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

	def allRobots
		@robots.each do |r|
			r.shout
		end
	end
end
