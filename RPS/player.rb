class Player
	attr_accessor :weapon, :score

	def initialize
		@weapon = ""
		@score = 0
	end

	def chooses_weapon
		while true
			puts "\nRock, paper, scissors?"
			self.weapon = gets.chomp.downcase
			break if WEAPONS.include?(self.weapon)
		end
	end

	def wins_rps
		puts "Player wins the round."
		self.score += 1
	end
end