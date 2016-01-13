class Game

	def initialize
		main_menu
	end

	def main_menu
		selection = nil
		
		until selection == 1 || selection == 2
			puts "-----------"
			puts "Tic Tac Toe"
			puts "-----------"
			puts "New Game (1)"
			puts "Options  (2)"
			selection = gets.chomp.to_i
		end

		main_menu_select(selection)
	end

	def main_menu_select(input)
		input == 1 ? new_game : options
	end

	def new_game
		puts "NEW GAME"
	end

	def options
		puts "OPTIONS"
	end
end

Game.new