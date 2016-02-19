require 'spec_helper'

describe Player do
  describe ".generate_players" do

    it "should return an array" do
        expect(Player.generate_players).to be_instance_of Array
    end

    context "when players == {}" do
      before :each do
        @players = Player.generate_players
      end

      it "should return Human class as first player" do
        expect(@players[0]).to be_instance_of Human
      end

      it "should return 'Player' as first player name" do
        expect(@players[0].name).to eq "Player"
      end

      it "should return 'X' as first player marker" do
        expect(@players[0].marker).to eq "X"
      end

      it "should return Computer class as second player" do
        expect(@players[1]).to be_instance_of Computer
      end

      it "should return 'Computer' as second player name" do
        expect(@players[1].name).to eq "Computer"
      end

      it "should return 'O' as second player marker" do
        expect(@players[1].marker).to eq "O"
      end
    end

    context "when players argument is given" do
      before :each do
        @players = Player.generate_players(
          {:player1 => {:type => "C", :name => "Computer 1", :marker => "A"},
          :player2 => {:type => "H", :name => "Human 1", :marker => "B"},
          :player3 => {:type => "X", :name => "Control", :marker => "C"}})
      end

      it "should return an array equal to players argument size" do
        expect(@players.size).to eq 3
      end

      it "should return Human class if players[player][:type] == 'H'" do
        expect(@players[1]).to be_instance_of Human
      end

      it "should return Computer class if players[player][:type] != 'H'" do
        expect(@players[0]).to be_instance_of Computer
        expect(@players[2]).to be_instance_of Computer
      end

      it "should return :name as [player].name" do
        expect(@players[0].name).to eq "Computer 1"
        expect(@players[1].name).to eq "Human 1"
        expect(@players[2].name).to eq "Control"
      end

      it "should return :marker as [player].marker" do
        expect(@players[0].marker).to eq "A"
        expect(@players[1].marker).to eq "B"
        expect(@players[2].marker).to eq "C"
      end
    end
  end
end