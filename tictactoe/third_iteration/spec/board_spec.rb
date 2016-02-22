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

  describe "#tie?" do
    context "when 3 X 3 board is full" do
      it "should return true" do
        @board.state = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
        expect(@board.tie?).to be true
      end
    end

    context "when 3 X 3 board is not full" do
      it "should return false" do
        @board.state = ["X", nil, "O", "X", "O", "X", "O", "X", "O"]
        expect(@board.tie?).to be false
      end
    end

    context "when 4 X 4 board is full" do
      it "should return true" do
        @board.state = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O"]
        expect(@board.tie?).to be true
      end
    end

    context "when 4 X 4 board is not full" do
      it "should return false" do
        @board.state = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", nil]
        expect(@board.tie?).to be false
      end
    end
  end

  describe "#update" do
    it "should add marker at index" do
      @board.update(5, "X")
      expect(@board.state).to eq([nil, nil, nil, nil, nil, "X", nil, nil, nil])
    end
  end

  describe "#get_lines" do
    context "when board is 3 X 3" do
      it "should return an array with the 8 correct lines" do
        expect(@board.get_lines).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]])
      end
    end

    context "when board is 4 X 4" do
      it "should return an array with the 10 correct lines" do
        @board = Board.new(:size => 4)
        expect(@board.get_lines).to eq([[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]])
      end
    end
  end

  describe "#get_rows" do
    context "when board is 3 X 3" do
      it "should return 3 correct rows" do
        expect(@board.get_rows).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
      end
    end

    context "when board is 4 X 4" do
      it "should return 4 correct rows" do
        @board = Board.new(:size => 4)
        expect(@board.get_rows).to eq([[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]])
      end
    end
  end

  describe "#get_columns" do
    context "when board is 3 X 3" do
      it "should return 3 correct columns" do
        expect(@board.get_columns).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
      end
    end

    context "when board is 4 X 4" do
      it "should return 4 correct columns" do
        @board = Board.new(:size => 4)
        expect(@board.get_columns).to eq([[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]])
      end
    end
  end

  describe "#get_diagonals" do
    context "when board is 3 X 3" do
      it "should return 2 correct diagonals" do
        expect(@board.get_diagonals).to eq([[0, 4, 8], [2, 4, 6]])
      end
    end

    context "when board is 4 X 4" do
      it "should return 2 correct diagonals" do
        @board = Board.new(:size => 4)
        expect(@board.get_diagonals).to eq([[0, 5, 10, 15], [3, 6, 9, 12]])
      end
    end
  end

  describe "#space_available?" do
    context "when space is filled" do
      it "should return false" do
        @board.state = ["X", "O", "X", nil, nil, nil, nil, nil, nil]
        expect(@board.space_available?(0)).to be false
      end
    end

    context "when space is not filled" do
      it "should return true" do
        @board.state = ["X", "O", "X", nil, nil, nil, nil, nil, nil]
        expect(@board.space_available?(3)).to be true
      end
    end
  end

  describe "#available_spaces" do
    it "should return an Array of available spaces" do
      @board.state = ["X", "O", "X", nil, nil, nil, nil, nil, nil]
      expect(@board.available_spaces).to eq([3, 4, 5, 6, 7, 8])
    end
  end

  describe "#win?" do
    context "with a winner on a 3 X 3 board" do
      it "should return true" do
        @board.state = ["X", "X", "X", "O", nil, "O", nil, nil, nil]
        expect(@board.win?).to be true
      end
    end

    context "with no winner on a 3 X 3 board" do
      it "should return false" do
        @board.state = ["X", "O", "X", "X", "O", "O", "O", "X", "X"]
        expect(@board.win?).to be false
      end
    end

    context "with a winner on a 4 X 4 board" do
      it "should return true" do
        @board = Board.new(:size => 4)
        @board.state = ["X", "O", "O", "O", nil, "X", nil, nil, nil, nil, "X", nil, nil, nil, nil, "X"]
        expect(@board.win?).to be true
      end
    end

    context "with no winner on a 4 X 4 board" do
      it "should return false" do
        @board = Board.new({:size => 4})
        @board.state = ["X", "O", "O", "O", nil, "X", nil, nil, nil, nil, "X", nil, nil, nil, nil, nil]
        expect(@board.win?).to be false
      end
    end
  end

  describe "#winner" do
    context "with first player as winner on a 3 X 3 board" do
      it "should return first player" do
        @board.state = ["X", "X", "X", "O", nil, "O", nil, nil, nil]
        expect(@board.winner).to eq "X"
      end
    end

    context "with second player as winner on a 3 X 3 board" do
      it "should return second player" do
        @board.state = ["X", nil, "X", "O", "O", "O", nil, nil, "X"]
        expect(@board.winner).to eq "O"
      end
    end

    context "with first player as winner on a 4 X 4 board" do
      it "should return first player" do
        @board = Board.new(:size => 4)
        @board.state = ["X", "O", "O", "O", nil, "X", nil, nil, nil, nil, "X", nil, nil, nil, nil, "X"]
        expect(@board.winner).to eq "X"
      end
    end

    context "with second player as winner on a 4 X 4 board" do
      it "should return second player" do
        @board = Board.new(:size => 4)
        @board.state = ["O", "O", "O", "O", "X", "X", nil, nil, nil, nil, "X", nil, nil, nil, nil, "X"]
        expect(@board.winner).to eq "O"
      end
    end
  end
end