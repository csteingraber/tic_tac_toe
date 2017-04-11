#= The Board
#This class is reponsible for maintaining
#the state of the X's and O's at any given
#time during the game and provides the functionality
#for drawing on it, seeing it, clearing it, and
#calculating the spaces available to draw on.
class GameBoard
	attr_reader :board

	# Creates the empty 3X3 board.
	def initialize
		@board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
	end

	# Given the current player's letter and desired coordinates,
	# draw their letter on the board.
	def draw(letter, x_coordinate, y_coordinate)
		# Are the user's coordinates on the board and free to occupy?
		if x_coordinate.between?(0, 2) && y_coordinate.between?(0, 2)
			if @board[y_coordinate][x_coordinate] == "_"
				@board[y_coordinate][x_coordinate] = letter
			else
				puts "You can't draw on a tile that's already been used!"
			end
		else
			puts "That is not on the board!"
		end
	end

	# Formats and prints the board the the screen with "_"
	# representing an empty spot.
	def print_board
		@board.each do |row|
			row.each { |column| print "#{column}  " }
			print "\n"
		end
		puts
		puts "-------" # Create a visual separation between turns.
		puts
	end

	# Fills in every spot with the empty character "_".
	def clear_board
		@board.map! { |row| row.map { "_" } }
	end

	# Returns an array of arrays. Each child array has two elements,
	# the x-coordinate and the y-coordinate of the available space. 
	def available_spaces
		spaces = []

		@board.each_with_index do |row, index|
			row.each_index { |column| spaces << [column, index] if @board[index][column] == "_" }
		end
		
		spaces
	end
end