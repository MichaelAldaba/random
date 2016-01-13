class Game
	attr_reader :main_menu

	def initialize
		@main_menu = { 1 => "New Game", 2 => "Options"}
		puts "-----------\nTic Tac Toe\n-----------"
		show_menu(main_menu)
	end

	def show_menu(menu)
		selection = nil
		until menu.has_key?(selection)
			print_menu(menu)
			selection = gets.chomp.to_i
		end
	end
	
	def print_menu(menu)
		menu.each do |key, value|
			print_sub_menu(key, value)
		end
	end

	def print_sub_menu(key, value)
		puts "(#{key})" + " " + "#{value}"
	end

end

Game.new