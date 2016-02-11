require_relative '../mars_map'
require_relative '../robot'
require 'test/unit'
class TestMarsMap < Test::Unit::TestCase

	# Tests whether coordinate is off map
	def test_off_map
		mars_map = MarsMap.new(5,3)
		assert_equal(true,mars_map.is_off_map?(5,4))
	end

	# Tests whether coordinate is in the map
	def test_in_map
		mars_map = MarsMap.new(5,3)
		assert_equal(false,mars_map.is_off_map?(1,2))
	end

	# Test if instruction to move
	# forward is ignored if scent position
	def test_scent_position
		mars_map = MarsMap.new(5,3)
		mars_map.scent_positions << [3,3]
		robot = Robot.new(3,2,'N')
		robot = mars_map.add_robot(robot,['F','F','F'])
		# Should ignore instruction to move forward
		# Since next move is off map,
		# And current position is a scent position
		assert_equal([3,3],[robot.x,robot.y])
	end

	# Test if a scent position is added
	def test_add_scent
		mars_map = MarsMap.new(5,3)
		robot = Robot.new(5,3,'N')
		mars_map.add_robot(robot,['F'])
		assert_equal(true,(mars_map.scent_positions.include? [5,3]))
	end
	
end