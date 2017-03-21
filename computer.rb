require "./player"

class Computer < Player
	def make_decision(available)
		guess_range = available.size
		[@letter] + available[rand(available.size)]
	end
end