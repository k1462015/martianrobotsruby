# Red Badger #
Developer Programming Problem. 

[Click here to download coding challenge PDF.](https://github.com/k1462015/martianrobotsruby/raw/master/CodingChallenge2015v2.__1_.pdf)

### Requirements ###

* Ruby (Version 2.2.1 was used in development)

### How do I get set up? ###

* Go to directory
* run - ruby martian_robots.rb
* To finish entering inputs - type "finish"

### To run tests ###
* Go to /tests directory
* run `ruby test_robot.rb`
* run `ruby test_mars_map.rb`

## Instructions ##
* First line of input MUST be the upper-right coordinates of the rectangular world (E.G. 5,3)
* After this, for each robot
* 1st Line - Intial Robot position
	* X Y O
	* Where X,Y are coordinates
	* And O is orientation ('N','E','S','W')
* 2nd Line - Instructions
	* LRF
	* Where L = move left
	* Where R = move right
	* Where F = move forward

## Notes ##
* There is no input validation, hence input must be exactly in the order as stated in instructions
* For every robot, there MUST be 2 lines indicating intial position and instructions

## Sample Input ##
* 5 3
* 1 1 E
* RFRFRFRF
* 3 2 N
* FRRFLLFFRRFLL
* 0 3 W
* LLFFFLFLFL

## Sample Output ##
* 1 1 E
* 3 3 N LOST
* 2 3 S
