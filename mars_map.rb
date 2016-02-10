class MarsMap
	attr_accessor :scent_positions

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

	    	# Check if next forward position is off map/grid
	    	if is_off_map? forward_position[0],forward_position[1]
	    		# If current position is a scent position
	    		# Then ignore to move forward
	    		unless is_scent_position? robot.x,robot.y
	    			# Since next position is not a scent position
	    			# Robot is now lost
    				scents_to_add << [robot.x,robot.y]
    				robot.move_forward
    				robot.status = 'LOST'
    			end
    		else
    			robot.move_forward
    		end
	    end
	  end

	  # Adds new scent position, to scent positions
	  scents_to_add.each do |scent|
	    @scent_positions << [scent[0].to_i,scent[1].to_i]
	  end

      @robots << robot
      return robot
	end

	# Checks if X,Y coordinate is a scent position
	def is_scent_position?(x,y)
      @scent_positions.include? [x.to_i,y.to_i]
	end	

	# Checks if X,Y coordinate is off the map
	def is_off_map?(x,y)
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
