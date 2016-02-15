class Board
  attr_reader :size

  def initialize(args = {})
    @size = args[:size] || 3
  end

end