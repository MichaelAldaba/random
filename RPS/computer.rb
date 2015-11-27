class Computer
	attr_accessor :score, :weapon

	def initialize
		@weapon = ""
		@score = 0
	end

	def chooses_weapon
		self.weapon = WEAPONS.sample
	end

	def wins_rps
		puts "Computer wins the round."
		self.score += 1
	end
end