require_relative 'game'

play_again = true

while play_again
  players = Console.start
  game = Game.new(:players => players)
  game.play
  play_again = Console.play_again?
end

Console.goodbye