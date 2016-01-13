class MainMenu
	attr_reader :list
	def initialize
		@list = { 	
			1 => SubMenu.new("Go First").name, 
			2 => SubMenu.new("Go Second").name, 
			3 => SubMenu.new("Versus").name, 
			4 => SubMenu.new("Computer Mode").name, 
			5 => SubMenu.new("Marker Selection").name,
		}
	end
end