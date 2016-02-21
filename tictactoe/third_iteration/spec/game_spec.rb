require 'spec_helper'

describe Game do 
  before :each do
    @game = Game.new
  end

  describe ".new" do
    context "with default board size of 3" do
      it "should have an empty 3 X 3 board" do
        expect(@game.board.state).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
      end

      it "should have a first player" do
        expect(@game.first_player).to be_a Player
      end

      it "should have a second player" do
        expect(@game.second_player).to be_a Player
      end

      it "should have the winning lines" do
        expect(@game.winning_lines).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]])
      end
    end

    context "with a board size of 4" do
      it "should have an empty 4 X 4 board" do
        @game = Game.new(:size => 4)
        expect(@game.board.state).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil])
      end
    end
  end

  describe "#current_player" do
    it "should be equal to first_player" do
      expect(@game.current_player).to be @game.first_player
    end
  end

  describe "#other_player" do
    it "should be equal to second_player" do
      expect(@game.other_player).to be @game.second_player
    end
  end

  describe "#end_turn!" do
    it "should change current_player to other_player" do
      player = @game.current_player
      @game.end_turn!
      expect(@game.other_player).to be player
    end

    it "should change other_player to current_player" do
      player = @game.other_player
      @game.end_turn!
      expect(@game.current_player).to be player
    end
  end
end