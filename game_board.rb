class GameBoard
	def initialize
		@board = [["", "", ""], ["", "", ""], ["", "", ""]]
	end

	def draw(letter, x_coordinate, y_coordinate)
		if x_coordinate.between?(0, 2) && y_coordinate.between?(0, 2)
			if @board[y_coordinate][x_coordinate].empty?
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
	end

	def clear_board
		@board.map! do |row|
			row.map do
				""
			end
		end
	end
end