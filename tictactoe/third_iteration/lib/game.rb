require_relative 'board'
require_relative 'console'
require_relative 'player'

class Game
	attr_reader :board, :first_player, :second_player, :winning_lines
	attr_accessor :players
	
	def initialize(args = {})
		@board = Board.new(:size => args[:size])
		@players = Player.generate_players(args[:players])
		@first_player = players.first
		@second_player = players.last
		@winning_lines = board.get_lines
	end

	def play
		Console.display(:board => board, :first_player => first_player, :second_player => second_player, :current_player => current_player)
	end

	def current_player
		players.first
	end

	def other_player
		players.last
	end

	def end_turn!
		self.players = players.rotate
	end

	def over?
		win?(first_player, second_player) || tie?
	end

	def win?(player1, player2)
		[player1.marker, player2.marker].each do |marker|
			@winning_lines.each do |line|
				counter = 0
				line.each do |position|
					counter += 1 if board.state[position] == marker
					return true if counter == board.size
				end
			end
		end

		false
	end

	def tie?
		board.full?
	end

	def winner(player1, player2)
		board.state.count(player1.marker) > board.state.count(player2.marker) ? player1.marker : player2.marker
	end

end