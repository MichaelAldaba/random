class Game
	attr_accessor :board, :player, :computer

	def initialize (player, computer)
		@board = []
		@player = player
		@computer = computer
	end

	def new_board
		self.board = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
	end

	def show_board
		puts
		board.each do |row|
			puts " #{row[0]} | #{row[1]} | #{row[2]}"
			puts "-----------" if row != board.last
		end
		puts
	end

end

board = Board.new
board.new_board
board.show_board