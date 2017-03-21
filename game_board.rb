class GameBoard
	def initialize
		@board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
	end

	def draw(letter, x_coordinate, y_coordinate)
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

	def print_board
		@board.each do |row|
			row.each do |column|
				print "#{column}  "
			end
			print "\n"
		end
		puts
		puts "-------"
		puts
	end

	def clear_board
		@board.map! do |row|
			row.map do
				"_"
			end
		end
	end

	def available_spaces
		spaces = []
		@board.each_with_index do |row, index|
			row.each_index { |column| spaces << [column, index] if @board[index][column] == "_" }
		end
		spaces
	end
end