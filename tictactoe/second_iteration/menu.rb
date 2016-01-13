class Menu
	attr_reader :list

	def initialize
		@list = { 
			1 => "Go First", 
			2 => "Go Second",
			3 => "Versus",
			4 => "Computer Mode",
			5 => "Marker Selection"
		}
	end

end