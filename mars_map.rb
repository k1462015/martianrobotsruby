class MarsMap

	def initialize(x_max,y_max)
	  @x_max = x_max.to_i
	  @y_max = y_max.to_i
	  @robots = []
	  @scent_positions = []
	end

	# Adds robot to mars map
	# And executes it's instructions
	def add_robot(robot,instructions)
	  scents_to_add = []
	  instructions.each do |instruction|
	  	# If instruction is a turn instruction
	    if instruction == 'R' || instruction == 'L'
	    	robot.turn(instruction)
	    else
	    	# If instruction is a forward instruction
	    	forward_position = robot.forward_position
	    	# Check if future position is a scent position
	    	# If not scent position, execute forward move, else ignore
	    	unless is_scent_position(forward_position[0],forward_position[1])
	    		# If new position off map, add to scent positions
	    		if is_off_map(forward_position[0],forward_position[1])
	    			scents_to_add << [forward_position[0],forward_position[1]]
	    			robot.status = 'LOST'
	    		end
	    		robot.move_forward
	    	end
	    end
	  end

	  # Adds any new scent position, to scent positions
	  scents_to_add.each do |scent|
	    @scent_positions << [scent[0].to_i,scent[1].to_i]
	  end

      @robots << robot

	end

	# Checks if X,Y coordinate is a scent position
	def is_scent_position(x,y)
      @scent_positions.include? [x.to_i,y.to_i]
	end	

	# Checks if X,Y coordinate is off the map
	def is_off_map(x,y)
      x = x.to_i
      y = y.to_i

      if x > @x_max || x < 0 || y > @y_max || y < 0
        return true
      else
        return false
      end
	end

	# Invokes shout on all robots within the map
	def all_robots
      @robots.each do |r|
        r.shout
      end
	end
end
