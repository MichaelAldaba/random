require_relative 'player.rb'

class Person < Player
	attr_accessor :letter, :name, :score

	def initialize
		@letter = "O"
		@name = "Player"
		@score = [0, 0, 0, 0, 0, 0, 0, 0]
	end

	def prompt(available_moves)
		puts "Where would you like to play your #{letter}? #{available_moves}"
		next_move = gets.chomp.to_i

		while !available_moves.include?(next_move)
			puts "\nPlease enter a valid move. #{available_moves}"
			next_move = gets.chomp.to_i
		end

		puts "\nYou played at #{next_move}"
		update_score(next_move)
		return next_move
	end
end