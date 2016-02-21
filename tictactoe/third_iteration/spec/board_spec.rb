require 'spec_helper'

describe Board do
  before :each do
    @board = Board.new
  end

  describe ".new" do
    it "should create a Board object" do
      expect(@board).to be_an_instance_of Board
    end
  end

  describe "#size" do 
    context "when :size is not given" do
      it "size should return :size" do
        @board = Board.new(:size => 4)
        expect(@board.size).to eq 4
      end
    end

    context "when :size is not given" do
      it "size return 3" do
        expect(@board.size).to eq 3
      end
    end
  end

  describe "#empty?" do
    context "when board is empty" do
      it "should return true" do
      expect(@board.empty?).to be true
      end
    end

    context "when board is not empty" do
      it "should return false" do
        @board.state = [nil, nil, nil, "X", nil, nil, nil, nil, nil]
        expect(@board.empty?).to be false
      end
    end
  end

  describe "#full?" do
    context "when board is full" do
      it "should return true" do
        @board.state = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
        expect(@board.full?).to be true
      end
    end

    context "when board is not full" do
      it "should return false" do
        @board.state = ["X", nil, "O", "X", "O", "X", "O", "X", "O"]
        expect(@board.full?).to be false
      end
    end
  end
end