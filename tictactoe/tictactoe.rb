class Player
	def update_score(next_move)
		case next_move
		when 1
			self.score[0] += 1
			self.score[3] += 1
			self.score[6] += 1
		when 2
			self.score[0] += 1
			self.score[4] += 1
		when 3
			self.score[0] += 1
			self.score[5] += 1
			self.score[7] += 1
		when 4
			self.score[1] += 1
			self.score[3] += 1
		when 5
			self.score[1] += 1
			self.score[4] += 1
			self.score[6] += 1
			self.score[7] += 1
		when 6
			self.score[1] += 1
			self.score[5] += 1
		when 7
			self.score[2] += 1
			self.score[3] += 1
			self.score[7] += 1
		when 8
			self.score[2] += 1
			self.score[4] += 1
		when 9
			self.score[2] += 1
			self.score[5] += 1
			self.score[6] += 1
		end
	end

end

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

class Board
	attr_accessor :board, :available_moves

	def initialize
		@board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
		@available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]

	end

	def show
		puts
		board.each do |row|
			puts " #{row[0]} | #{row[1]} | #{row[2]}"
			puts "-----------" unless row == board.last
		end
		puts
	end

	def update(move, player)
		if move < 4
			player.letter == "X" ? (board[0][move - 1] = "X") : (board[0][move - 1] = "O")
		elsif move < 7
			player.letter == "X" ? (board[1][move - 4] = "X") : (board[1][move - 4] = "O")
		else
			player.letter == "X" ? (board[2][move - 7] = "X") : (board[2][move - 7] = "O")
		end

		available_moves.delete(move)
		show
	end
end

class Game
	attr_accessor :board, :person, :computer

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
		game_in_progress = true
		while game_in_progress
			if game_in_progress
				board.update(first.prompt(board.available_moves), first)

				game_in_progress = false if tie? || player_won?(first)
			end

			if game_in_progress
				board.update(second.prompt(board.available_moves), second)

				game_in_progress = false if tie? || player_won?(second)
			end
		end

		restart
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