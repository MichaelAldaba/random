require 'spec_helper'

describe Board do
  before :each do
    @board = Board.new
  end

  describe "#size" do 
    context "when :size is given" do
      it "size should return :size" do
        @board = Board.new(:size => 4)
        expect(@board.size).to eq 4
      end
    end

    context "when :size isn't given" do
      it "size return 3 if :size isn't an argument" do
        expect(@board.size).to eq 3
      end
    end
  end

end