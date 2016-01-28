class Computer
  attr_reader :marker, :name, :other_marker

  def initialize(args)
    @marker = args[:marker]
    @name = args[:name]
    @other_marker = args[:other_marker]
  end

  def turn(b)
    if b.list[4].class == Fixnum
      puts "#{name} chose square # 5"
      puts
      4
    else
      get_best_move(b)
    end
  end

  def get_best_move(b)
    best_move = nil

    b.available_spots.each do |spot|
      b.list[spot] = marker

      if b.game_over?
        best_move = spot
        b.list[spot] = spot + 1
      else
        b.list[spot] = other_marker
        if b.game_over?
          best_move = spot
          b.list[spot] = spot + 1
        else
          b.list[spot] = spot + 1
        end
      end
    end

    if best_move
      puts "#{name} chose square # #{best_move + 1}"
      puts
      return best_move
    else
      if b.scenario_one_two? && b.list[4] == marker
        best_move = [1, 3, 5, 7].sample
      elsif b.scenario_three? && b.list[4] == marker
        best_move = [7, 8].sample
      elsif b.scenario_four? && b.list[4] == marker
        best_move = [1, 2].sample
      elsif b.scenario_five? && b.list[4] == marker
        best_move = [6, 7].sample
      elsif b.scenario_six? && b.list[4] == marker
        best_move = 1
      elsif b.scenario_seven? && b.list[4] == marker
        best_move = 6
      elsif b.scenario_eight? && b.list[4] == marker
        best_move = 8
      elsif b.scenario_nine? && b.list[4] == marker
        best_move = 0
      elsif b.scenario_ten? && b.list[4] == marker
        best_move = 2
      else 
        if b.available_corners.size > 0
          best_move = b.available_corners.sample
        else
          best_move = b.available_sides.sample
        end
      end
    end

    puts "#{name} chose square # #{best_move + 1}"
    puts
    
    best_move
  end

end