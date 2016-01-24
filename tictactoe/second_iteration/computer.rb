class Computer
	attr_reader :marker, :name

	def initialize(args)
		@marker = args[:marker]
		@name = args[:name]
	end

	def turn(b)
		spot = nil

		loop do 
			spot = rand(0..9)
			break if b.list[spot].class == Fixnum
		end

		puts "#{name} chose square # #{spot + 1}."
		puts

		spot
	end

end