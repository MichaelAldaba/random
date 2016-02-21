class Board
  attr_reader :size
  attr_accessor :state

  def initialize(args = {})
    @size = args[:size] || 3
    @state = Array.new(size ** 2, nil)
  end

  def empty?
  	state == Array.new(size ** 2, nil)
  end

  def full?
  	!state.include?(nil)
  end

  def update(index, marker)
  	self.state[index] = marker
  end

  def get_lines
    get_rows + get_columns + get_diagonals
  end

  def get_rows
    rows = []
    numbers = (0..(size ** 2 - 1)).to_a
    numbers.each_slice(size) do |line|
      rows << line
    end 
    rows
  end

  def get_columns
    get_rows.transpose
  end

  def get_diagonals
    diagonals = []
    down_right_diagonal = []
    0.upto(size - 1) do |num|
      down_right_diagonal << num * (size + 1)
    end

    diagonals << down_right_diagonal

    down_left_diagonal = []
    0.upto(size - 1) do |num|
      down_left_diagonal << (num + 1) * (size - 1)
    end

    diagonals << down_left_diagonal

    diagonals
  end

end