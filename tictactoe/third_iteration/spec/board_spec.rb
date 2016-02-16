require 'spec_helper'

describe Board do
  before :each do
    @board = Board.new
  end

  describe "#size" do 
    it "size should be :size if :size is an argument" do
      @board = Board.new(:size => 4)
      expect(@board.size).to eq 4
    end

    it "size should be 3 if :size isn't an argument" do
      expect(@board.size).to eq 3
    end
  end
end
