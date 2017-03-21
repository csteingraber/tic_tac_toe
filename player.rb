class Player
	def initialize(letter)
		@letter = letter
	end

	def make_decision
		puts "What row?"
		y_coordinate = gets.to_i - 1
		puts "What column?"
		x_coordinate = gets.to_i - 1
		[@letter, x_coordinate, y_coordinate]
	end
end