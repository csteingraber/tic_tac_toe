require "player"

#= Opponent
#This class acts as your adversary and inherits
#the attributes and functionality of the Player
#class. The decision functionality has been 
#overwritten to ensure that the Computer makes 
#decisions based on _available_ spaces on the 
#board. 
class Computer < Player
	# Takes input array of available x,y coordinates
	# and returns an array consisiting of the Computer's
	# letter and chosen x,y coordinates.
	def make_decision(available)
		guess_range = available.size
		[@letter] + available[rand(available.size)]
	end
end