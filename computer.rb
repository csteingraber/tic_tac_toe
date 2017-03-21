class Computer < Player
	def make_decision
		x_coordinate = rand 3
		y_coordinate = rand 3
		[@letter, x_coordinate, y_coordinate]
	end
end