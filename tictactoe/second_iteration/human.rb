class Human
  attr_reader :marker, :name

  def initialize(args)
    @marker = args[:marker]
    @name = args[:name]
  end

  def turn(b)
    spot = nil

    loop do
      print "Enter square # to place your #{marker} in: "
      spot = gets.chomp.to_i
      spot -= 1
      puts
      break if b.list[spot].class == Fixnum && spot > -1
    end

    spot
  end

end