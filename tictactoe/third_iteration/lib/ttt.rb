require_relative 'game'

play_again = true

while play_again
  players = Console.start
  #Game.new(:players => players)
  play_again = Console.play_again?
end

Console.goodbye