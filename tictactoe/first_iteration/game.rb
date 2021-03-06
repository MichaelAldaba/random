require_relative 'board.rb'
require_relative 'computer.rb'
require_relative 'person.rb'
require_relative 'player.rb'

class Game
	attr_accessor :board, :person, :computer, :game_in_progress

	def initialize
		@board = Board.new
		@person = Person.new
		@computer = Computer.new
		start_game
	end

	def start_game
		determine_turn_order
		board.show

		person.letter == "X" ? take_turns(person, computer) : take_turns(computer, person)
	end

	def determine_turn_order
		while true
			puts "\nDo you want to be X or O?"
			input = gets.chomp.upcase
			break if input == "X" || input == "O"
		end

		if input == "X"
			puts "\nYou start."
			person.letter = "X"
		else
			puts "\nThe computer starts."
			computer.letter = "X"
		end
	end

	def take_turns(first, second)
		@game_in_progress = true
		
		while game_in_progress
			player_turn(first)
			sleep(2)
			player_turn(second)
		end

		restart
	end

	def player_turn(player)
		if game_in_progress
			board.update(player.prompt(board.available_moves), player)
			self.game_in_progress = false if tie? || player_won?(player)
		end
	end

	def tie?
		if board.available_moves.size == 0
			puts "Tie!"
			return true
		end
	end

	def player_won?(player)
		player.score.each do |tier|
			if tier == 3
				puts "#{player.name} wins!"
				return true
			end
		end
		return false
	end

	def restart
		puts "\nDo you want to play again? Yes or no?"
		input = gets.chomp.downcase

		until input == "yes" || input == "no"
			puts "\nPlay again? Yes or no?"
			input = gets.chomp.downcase
		end

		if input == "yes"
			game = Game.new
		end
	end

end

game = Game.new