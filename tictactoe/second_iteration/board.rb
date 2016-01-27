class Board
  attr_accessor :list

  def initialize
    @list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts " #{list[0]} | #{list[1]} | #{list[2]}"
    puts "-----------"
    puts " #{list[3]} | #{list[4]} | #{list[5]}"
    puts "-----------"
    puts " #{list[6]} | #{list[7]} | #{list[8]}"
    puts
  end

  def available_spots
    available = []
    list.each_index do |i|
      available << i if list[i].class == Fixnum
    end
    
    available
  end

  def game_over?
    win? || tie?
  end

  def win?
    horizontal_win? ||
    vertical_win?   ||
    diagonal_win?
  end

  def horizontal_win?
    check_win?(0, 1, 2) ||
    check_win?(3, 4, 5) ||
    check_win?(6, 7, 8)
  end

  def check_win?(a, b, c)
    l = list
    [l[a], l[b], l[c]].uniq.length == 1
  end

  def vertical_win?
    check_win?(0, 3, 6) ||
    check_win?(1, 4, 7) ||
    check_win?(2, 5, 8)
  end

  def diagonal_win?
    check_win?(0, 4, 8) ||
    check_win?(2, 4, 6)
  end

  def tie?
    list.all? { |s| s.class == String }
  end

  def scenario_one_two?
    available_spots == [0, 1, 3, 5, 7, 8] ||
    available_spots == [1, 2, 3, 5, 6, 7]
  end

  def scenario_three?
    available_spots == [0, 1, 2, 3, 7, 8]
  end

  def scenario_four?
    available_spots == [1, 2, 3, 6, 7, 8]
  end

  def scenario_five?
    available_spots == [0, 1, 2, 5, 6, 7]
  end

  def scenario_six?
    available_spots == [0, 1, 5, 6, 7, 8]
  end

end