require_relative '../Mastermind/player.rb'
require_relative '../Mastermind/game.rb'
require_relative '../Mastermind/computer.rb'

loop do
  puts "\nWelcome to the Mastermind Game \n\n"

  puts 'Please enter your name: '
  player = Player.new(gets.chomp.capitalize)

  game = Game.new(player)
  game.play

  puts "\nPlay again (Y/N)?"
  exit unless gets.chomp.capitalize == 'Y'
end
