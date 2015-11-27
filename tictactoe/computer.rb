require_relative 'player.rb'

class Computer < Player
	attr_accessor :letter, :name, :score

	def initialize
		@letter = "O"
		@name = "Computer"
		@score = [0, 0, 0, 0, 0, 0, 0, 0]
	end

	def prompt(available_moves)
		next_move = available_moves.sample
		puts "Computer played at #{next_move}."
		update_score(next_move)
		return next_move
	end
end