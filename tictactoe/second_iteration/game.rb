class Game
	attr_reader :main_menu, :title

	def initialize
		@title = "-----------\nTic Tac Toe\n-----------"
		@main_menu = { 1 => "New Game", 2 => "Options"}
		show_main_menu
	end

	def show_main_menu
		selection = nil
		until main_menu.has_key?(selection)
			print_main_menu
			selection = gets.chomp.to_i
		end
	end
	
	def print_main_menu
		puts title
		iterate_menu(main_menu)
	end
	
	def iterate_menu(menu)
		menu.each do |key, value|
			print_sub_menu(key, value)
		end
	end

	def print_sub_menu(key, value)
		puts "(#{key})" + " " + "#{value}"
	end

end

Game.new