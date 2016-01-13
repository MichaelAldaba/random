class SubMenu
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def method(name)
		case name
		when "Go First"
			go_first
		when "Go Second"
			go_second
		when "Versus"
			versus
		when "Computer Mode"
			computer_mode
		when "Marker Selection"
			marker_selection
		end
	end

end