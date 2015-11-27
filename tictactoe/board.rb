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