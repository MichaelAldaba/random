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

  def move(args = {})
    index = Console.human_input(args[:board])
  end
end

class Computer < Player
  attr_reader :other_marker

  def initialize(args = {})
    @name = args[:name]
    @marker = args[:marker]
    @other_marker = args[:other_marker]
  end
end