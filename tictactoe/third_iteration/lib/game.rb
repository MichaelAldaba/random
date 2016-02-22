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
		until over?
			index = nil
			error = false

			loop do
				if error == false
					Console.display(:board => board, :first_player => first_player, :second_player => second_player, :current_player => current_player)
				else
					Console.display(:board => board, :first_player => first_player, :second_player => second_player, :current_player => current_player, :error => true)
				end

				index = current_player.move(:board => board, :current_player => current_player, :other_player => other_player, :first_player => first_player, :second_player => second_player)

				break if Console.valid_input?(index, board)

				error = true
			end

			board.update(index, current_player.marker)
			end_turn!
		end

		end_game
	end

	def end_game
		Console.display(:board => board, :first_player => first_player, :second_player => second_player, :current_player => current_player, :over => true)
		if board.win?(first_player, second_player)
			Console.show_winner(winner(first_player, second_player))
		else
			Console.show_tie(first_player, second_player)
		end
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
		board.win?(first_player, second_player) || board.tie?
	end

	def winner(player1, player2)
		board.state.count(player1.marker) > board.state.count(player2.marker) ? player1 : player2
	end

end