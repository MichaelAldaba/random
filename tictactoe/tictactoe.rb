class Board
	attr_accessor :board

	def initialize
		@board = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
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

board.show_board