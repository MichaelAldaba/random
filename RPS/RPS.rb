require_relative 'computer.rb'
require_relative 'player.rb'

WEAPONS = ["rock", "paper", "scissors"]

class RockPaperScissors
	attr_reader :computer, :player

	def initialize
		@computer = Computer.new
		@player = Player.new
		show_score
	end

	def show_score
		puts "\n-------------------------------------"
		puts "Player: #{player.score}".ljust(26) + "Computer: #{computer.score}"
		puts "-------------------------------------"
		sleep(1)

		player.score == 2 || computer.score == 2 ? game_over : game_start
	end

	def game_start
		player.chooses_weapon
		computer.chooses_weapon
		show_weapons
	end

	def show_weapons
		puts "\nPlayer:".ljust(11) + "#{player.weapon}"
		puts "Computer: #{computer.weapon}"
		sleep(2)

		player.weapon == computer.weapon ? tie : compare
	end

	def compare
		case player.weapon
		when "rock"
			if computer.weapon == "scissors"
				puts "\nRock crushes scissors."
				player.wins_rps
			else
				puts "\nPaper covers rock."
				computer.wins_rps
			end
		when "paper"
			if computer.weapon == "rock"
				puts "\nPaper covers rock."
				player.wins_rps
			else
				puts "\nScissors cuts paper."
				computer.wins_rps
			end
		when "scissors"
			if computer.weapon == "paper"
				puts "\nScissors cuts paper"
				player.wins_rps
			else
				puts "\nRock crushes scissors."
				computer.wins_rps
			end
		end

		restart
	end

	def tie
		puts "\nThe round is tied."
		restart
	end

	def restart
		sleep(2)
		show_score
	end

	def game_over
		player.score == 2 ? (puts "\nPlayer wins the match!") : (puts "\nComputer wins the match!")
	end
end

RockPaperScissors.new