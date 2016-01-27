class Computer
	attr_reader :marker, :name

	def initialize(args)
		@marker = args[:marker]
		@name = args[:name]
	end

=begin
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
=end

	def turn(b)
		selection = nil

		b.available_spots.each do |spot|
			b.list[spot] = marker

			if b.game_over?
				selection = spot
				b.list[spot] = spot + 1
			else
				b.list[spot] = spot + 1
			end
		end

		if selection
			return selection
		else
			return b.available_spots.sample
		end
	end

end