require 'spec_helper'

describe "#size" do 
  it "size should be :size if :size is initiated" do
    board = Board.new(:size => 4)
    expect(board.size).to eq 4
  end

  it "size should be 3 if :size isn't initiated" do
    board = Board.new
    expect(board.size).to eq 3
  end
end