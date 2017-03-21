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
		start
	end

	def start
		playing = true
		while playing
			letter, x_coordinate, y_coordinate = @player.make_decision
			until @board.draw(letter, x_coordinate, y_coordinate)
				letter, x_coordinate, y_coordinate = @player.make_decision
			end
			@board.print_board
			letter, x_coordinate, y_coordinate = @computer.make_decision(@board.available_spaces)
			@board.draw(letter, x_coordinate, y_coordinate)
			@board.print_board
		end
	end
end

Game.new