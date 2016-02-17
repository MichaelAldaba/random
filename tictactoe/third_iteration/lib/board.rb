class Board
  attr_reader :size
  attr_accessor :state

  def initialize(args = {})
    @size = args[:size] || 3
    @state = Array.new(@size ** 2, nil)
  end

end