# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

puts "enter player1's name"
player1_name = gets.chomp

puts "enter player1's symbol"

is_valid_symbol = false
until is_valid_symbol
  begin
    player1_symbol = gets.chomp.upcase
    player1 = Player.new(player1_name, player1_symbol)
  rescue ArgumentError => e
    puts e.message
  else
    is_valid_symbol = true
  end
end


puts "enter player2's name"
player2_name = gets.chomp

player2_symbol = player1_symbol == 'X' ? 'O' : 'X'
player2 = Player.new(player2_name, player2_symbol)

game = Game.new(player1, player2)
game.play
