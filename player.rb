class Player
	def initialize(letter)
		@letter = letter
	end

	def make_decision
		puts "What row?"
		y_coordinate = gets.chomp.to_i
		puts "What column?"
		x_coordinate = gets.chomp.to_i
		[@letter, x_coordinate, y_coordinate]
	end
end