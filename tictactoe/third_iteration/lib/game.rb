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

	def current_player
		players.first
	end

	def other_player
		players.last
	end

	def end_turn!
		self.players = players.rotate
	end

end