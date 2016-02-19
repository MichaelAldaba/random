require 'spec_helper'

describe Player do
  describe ".generate_players" do
    context "when players == {}" do
      before :each do
        @players = Player.generate_players
      end

      it "should have Human as first player" do
        expect(@players[0]).to be_instance_of Human
      end

      it "should have 'Player' as first player name" do
        expect(@players[0].name).to eq "Player"
      end

      it "should have 'X' as first player marker" do
        expect(@players[0].marker).to eq 'X'
      end

      it "should have Computer as second player" do
        expect(@players[1]).to be_instance_of Computer
      end

      it "should have 'Computer' as second player name" do
        expect(@players[1].name).to eq "Computer"
      end

      it "should have 'O' as second player marker" do
        expect(@players[1].marker).to eq "O"
      end
    end
  end
end