require "./game_board"
require "./player"
require "./computer"

class Game
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

	def three_in_a_diagonal?
		board = @board.board
		diagonal_rows = [[0, 1, 2], [2, 1, 0]]
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