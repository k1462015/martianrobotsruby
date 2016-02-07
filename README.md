# Red Badger Developer Programming Problem #
Coding challenge set by Red Badger.

### Requirements? ###

* Ruby
* Access to CMD/Terminal

### How do I get set up? ###

* Go to directory
* run - ruby martian_robots.rb

## Instructions ##
* First line of input should be the upper-right coordinates of the rectangular world (E.G. 5,3)
* After this, a sequence of inputs
* Example: 1 1 E
 * Where 1 1 indicates initial robot position
 * And E indicates initial direction robot is facing
* FRRFLLFFRRFLL
 * Where R indicates robot should turn right
 * L indicates robot should turn left
 * F indicates robot should go forward


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