require_relative '../robot'
require 'test/unit'
class TestRobot < Test::Unit::TestCase

	# Tests if correct coordinates
	# After moving forward
	def test_forward_move
		robot = Robot.new(0,0,'N')
		assert_equal([0,1],robot.forward_position)
	end

	# Tests if correct orientation
	# After turning right
	def test_turn_right
		robot = Robot.new(0,0,'N')
		robot.turn('R')
		assert_equal(1,robot.orientation)
	end

	# Tests if correct orientation
	# After turning left
	def test_turn_left
		robot = Robot.new(0,0,'E')
		robot.turn('L')
		assert_equal(0,robot.orientation)
	end
end