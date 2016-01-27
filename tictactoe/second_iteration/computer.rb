class Computer
  attr_reader :marker, :name, :other_marker

  def initialize(args)
    @marker = args[:marker]
    @name = args[:name]
    @other_marker = args[:other_marker]
  end

=begin
  def turn(b)
    spot = nil

    loop do 
      spot = rand(0..9)
      break if b.list[spot].class == Fixnum
    end

    puts "#{name} chose square # #{spot + 1}."
    puts

    spot
  end
=end

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
      else
        return b.available_spots.sample
      end
    end
  end

end