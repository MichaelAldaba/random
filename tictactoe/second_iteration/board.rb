class Board
	attr_accessor :list

	def initialize
		@list = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
	end

	def show
		puts " #{list[0]} | #{list[1]} | #{list[2]}"
		puts "-----------"
		puts " #{list[3]} | #{list[4]} | #{list[5]}"
		puts "-----------"
		puts " #{list[6]} | #{list[7]} | #{list[8]}"
		puts
	end

end