class Computer
  attr_reader :marker, :name, :other_marker

  def initialize(args)
    @marker = args[:marker]
    @name = args[:name]
    @other_marker = args[:other_marker]
  end

  def turn(b)
    if b.list[4].class == Fixnum
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
      return best_move
    else
      if b.scenario_one_two?
        return [1, 3, 5, 7].sample
      elsif b.scenario_three?
        return [7, 8].sample
      elsif b.scenario_four?
        return [1, 2].sample
      elsif b.scenario_five?
        return [6, 7].sample
      elsif b.scenario_six?
        return [0, 1].sample
      elsif b.scenario_seven?
        return 6
      elsif b.scenario_eight?
        return 8
      elsif b.scenario_nine?
        return 0
      elsif b.scenario_ten?
        return 2
      else 
        if b.available_corners.size > 0
          return b.available_corners.sample
        else
          return b.available_sides.sample
        end
      end
    end
  end

end