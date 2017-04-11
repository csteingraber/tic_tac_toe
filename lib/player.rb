#= You
#This class represents the user of this game and
#provides access to whether or not you are "X's"
#or "O's". This class also supplies the functionality
#to make decisions on where to place your letter on 
#board.
class Player
	attr_reader :letter

	# Assigns the user's choice of letter for the
	# remainder of the program execution.
	def initialize(letter)
		@letter = letter
	end

	# Takes input for the x-coordinate and the y-coordinate
	# of the desired space and returns an array containing 
	# the user's letter and aforementioned coordinates.
	def make_decision
		puts "What row?"
		y_coordinate = gets.to_i - 1

		puts "What column?"
		x_coordinate = gets.to_i - 1

		[@letter, x_coordinate, y_coordinate]
	end
end