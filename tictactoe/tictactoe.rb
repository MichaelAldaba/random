class Computer
	attr_accessor :first

	def initialize
		@first = true
	end

end

class Person
end

class Board
	attr_accessor :board

	def initialize
		@board = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
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
		if move < 3
			player.first ? (board[0][move] = "X") : (board[0][move] = "O")
		elsif move < 6
			player.first ? (board[1][move - 3] = "X") : (board[1][move - 3] = "O")
		else
			player.first ? (board[2][move - 6] = "X") : (board[2][move - 6] = "O")
		end
	end 
end

class Game
	attr_accessor :board, :person, :computer

	def initialize
		@board = Board.new
		@person = Person.new
		@computer = Computer.new
		board.show
		puts computer.first
		board.update(5, computer)
		board.show
	end

	def determine_turn_order
		while true
			puts "Do you want to be X or O?"
			input = gets.chomp.downcase
			break if input == "x" || input == "o"
		end

		if input == "x"
			puts "\nYou start."
		else
			puts "\nThe computer starts."
		end

	end

end

game = Game.new