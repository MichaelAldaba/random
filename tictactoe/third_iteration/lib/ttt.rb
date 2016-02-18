require_relative 'console.rb'

play_again = true

while play_again
  players = Console.start
  play_again = Console.play_again?
end

Console.goodbye