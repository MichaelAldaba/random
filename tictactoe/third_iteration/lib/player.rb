class Player
  DEFAULT_PLAYERS = {:player1 => {:type => "H", :name => "Player", :marker => "X"},
                    :player2 => {:type => "C", :name => "Computer", :marker => "O"}}
  attr_accessor :name, :marker

  def self.generate_players(players = {})
    players = DEFAULT_PLAYERS if players == {}
    players_array = []

    players.each_key do |player|
      if players[player][:type] == "H"
        players_array << Human.new(:name => players[player][:name], :marker => players[player][:marker])
      else
        players_array << Computer.new(:name => players[player][:name], :marker => players[player][:marker])
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
end

class Computer < Player
  def initialize(args = {})
    @name = args[:name]
    @marker = args[:marker]
  end
end