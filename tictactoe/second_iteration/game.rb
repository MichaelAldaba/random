require_relative "sub_menu"

MAIN_MENU = { 	
	1 => SubMenu.new("Go First").name, 
	2 => SubMenu.new("Go Second").name, 
	3 => SubMenu.new("Versus").name, 
	4 => SubMenu.new("Computer Mode").name, 
	5 => SubMenu.new("Marker Selection").name,
}

class Game
	attr_reader :main_menu

	def initialize
		@main_menu = MAIN_MENU
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