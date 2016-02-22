class Player
  DEFAULT_PLAYERS = {:player1 => {:type => "H", :name => "Player", :marker => "X"},
                    :player2 => {:type => "C", :name => "Computer", :marker => "O", :other_marker => "X"}}
  attr_accessor :name, :marker

  def self.generate_players(players = {})
    players = DEFAULT_PLAYERS if players == {} || players == nil
    players_array = []

    players.each_key do |player|
      if players[player][:type] == "H"
        players_array << Human.new(:name => players[player][:name], :marker => players[player][:marker])
      else
        players_array << Computer.new(:name => players[player][:name], :marker => players[player][:marker], :other_marker => players[player][:other_marker])
      end
    end

    players_array
  end
end

class Human < Player
  def initialize(args = {})
    @name = args[:name]
    @marker = args[:marker]
  end

  def move(board)
    index = Console.human_input(board)
  end
end

class Computer < Player
  attr_reader :other_marker, :best_choice

  def initialize(args = {})
    @name = args[:name]
    @marker = args[:marker]
    @other_marker = args[:other_marker]
  end

  def move(board)
    minimax(board, marker)
    best_choice
  end

  def minimax(board, current_player_marker)
    return score(board) if game_over?(board)

    scores = {}

    board.available_spaces.each do |space|
      potential_board = board.dup
      potential_board.update(space, current_player_marker)

      scores[space] = minimax(potential_board, switch(current_player_marker))
    end

    @best_choice, best_score = best_move(current_player_marker, scores)
    best_score
  end

  def game_over?(board)
    board.winner || board.tie?
  end

  def best_move(piece, scores)
    if piece == marker
      scores.max_by { |_k, v| v }
    else
      scores.min_by { |_k, v| v }
    end
  end

  def score(board)
    if board.winner == marker
      return 10
    elsif board.winner == other_marker
      return -10
    end
    0
  end

  def switch(piece)
    piece == marker ? other_marker : marker
  end
end