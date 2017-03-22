require "./game_board"
require "./player"
require "./computer"

#= Referee
#This class acts as the container for
#all of the other defined classes and executes
#all interactions between them. Upon instantiation,
#the first round of the game commences until someone
#wins or there is a tie. You are then given the option 
#to play another round or terminate the game.
class Game
	# Create GameBoard, Player, and Computer objects and start the game.
	def initialize
		@board = GameBoard.new
		choice = ""
		while choice != "X" && choice != "O"
			puts "Would you like to be \"X\" or \"O\"?"
			choice = gets.chomp.upcase
		end
		@player = Player.new(choice)
		if choice == "X"
			computer_letter = "O"
		else
			computer_letter = "X"
		end
		@computer = Computer.new(computer_letter)
		@playing = true
		start
	end

	# Executes loop of decision making, drawing to board, and checking for 
	# tie or victory until one of those conditions occurs. Upon
	# victory or tie, ask player if they want to play again.
	def start
		while @playing
			letter, x_coordinate, y_coordinate = @player.make_decision
			until @board.draw(letter, x_coordinate, y_coordinate)
				letter, x_coordinate, y_coordinate = @player.make_decision
			end
			@board.print_board
			victory_check?
			if @playing
				letter, x_coordinate, y_coordinate = @computer.make_decision(@board.available_spaces)
				@board.draw(letter, x_coordinate, y_coordinate)
				@board.print_board
				victory_check?
			end
		end

		puts "Would you like to play again?(y/n)"
		choice = gets.chomp.downcase
		if choice == "y"
			@board.clear_board
			@playing = true
			start
		else
			puts "Goodbye!"
		end
	end

	# Checks for 3 in a row, column, and diagonal and
	# stores results in an array. The array is checked for 
	# a bollean of true and its accompanied letter to determine who wins.
	# If no three in a row is found, check to see if there
	# are still available spaces to draw on the board.
	def victory_check?
		outcome = []
		outcome << three_in_a_row? << three_in_a_column? << three_in_a_diagonal?
		outcome.each do |element|
			if element[0] == true
				@playing = false
				puts "GAME OVER"
				if element[1] == @player.letter
					puts "YOU WIN!"
				else
					puts "COMPUTER WINS!"
				end
				return true
			end
		end

		if @board.available_spaces.size == 0
			@playing = false
			puts "GAME OVER"
			puts "TIE!"
		end
	end

	# Loops though each row to check for 3 consecutive occurrences of a letter
	# and returns an array with a boolean value and optional letter if the 
	# boolean is found to be true.
	def three_in_a_row?
		three_in_a_row = false
		occurrences = 0
		board = @board.board
		board.each do |row|
			if (current_letter = row[0]) != "_"
				row.each do |element|
					if element == current_letter
						occurrences += 1
					else
						occurrences = 0
						break
					end
				end
			else
				next
			end
			if occurrences == 3
				return [true, current_letter]
			end
		end
		[three_in_a_row]
	end

	# Loops though each column to check for 3 consecutive occurrences of a letter
	# and returns an array with a boolean value and optional letter if the 
	# boolean is found to be true.
	def three_in_a_column?
		board = @board.board
		three_in_a_column = false
		occurrences = 0
		3.times do |column|
			if (current_letter = board[0][column]) != "_"
				3.times do |row|
					if board[row][column] == current_letter
						occurrences += 1
					else
						occurrences = 0
						break
					end
				end
			else
				next
			end
			if occurrences == 3
				return [true, current_letter]
			end
		end
		[three_in_a_column]
	end

	# Loops though each diagonal to check for 3 consecutive occurrences of a letter
	# and returns an array with a boolean value and optional letter if the 
	# boolean is found to be true.
	def three_in_a_diagonal?
		board = @board.board
		diagonal_rows = [[0, 1, 2], [2, 1, 0]] # Order of row index accesses for top-left to
											   # to bottom right traversal first and then
											   # bottom-left to top-right traversal last.
		three_in_a_diagonal = false
		occurrences = 0
		diagonal_rows.each do |diagonal|
			if (current_letter = board[diagonal[0]][0]) != "_"
				3.times do |element|
					if board[diagonal[element]][element] == current_letter
						occurrences += 1
					else
						occurrences = 0
						break
					end
				end
			else
				next
			end
			if occurrences == 3
				return [true, current_letter]
			end
		end
		[three_in_a_diagonal]
	end
end

Game.new