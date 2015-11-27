class Computer
	attr_accessor :letter, :moves

	def initialize
		@letter = "O"
		@moves = []
	end

	def prompt(available_moves)
		next_move = available_moves.sample
		moves << next_move
		puts "Computer played at #{next_move}."
		return next_move
	end
end

class Person
	attr_accessor :letter, :moves

	def initialize
		@letter = "O"
		@moves = []
	end

	def prompt(available_moves)
		puts "Where would you like to play your #{letter}? #{available_moves}"
		next_move = gets.chomp.to_i
		while !available_moves.include?(next_move)
			puts "\nPlease enter a valid move. #{available_moves}"
			next_move = gets.chomp.to_i
		end
		moves << next_move
		puts "\nYou played at #{next_move}"
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
			puts "-----------" if row != board.last
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
		take_turns
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

	def take_turns
		board.update(person.prompt(board.available_moves), person)
		board.update(computer.prompt(board.available_moves), computer)
		print person.moves

	end


end

game = Game.new