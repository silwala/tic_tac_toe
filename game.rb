# frozen_string_literal: true

# class to make the game board
class Game
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  attr_accessor :occupied_spaces

  def initialize(player1, player2)
    @positions = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
    @player1 = player1
    @player2 = player2
    @game_over = false
  end

  def occupy_space(space)
    raise ArgumentError, "Space #{space} not available" if @positions[space] == ' '

    @occupied_spaces << space
    @current_player.occupied_spaces << space
  end

  def play
    @current_player = @player1
    puts "#{@current_player}'s turn - #{@current_player.symbol}'"
    draw_board
  end

  def draw_board
    puts "  #{@positions[1]}  |  #{@positions[2]}  |  #{@positions[3]}  "
    puts '_______________'
    puts "  #{@positions[4]}  |  #{@positions[5]}  |  #{@positions[6]}  "
    puts '________________'
    puts "  #{@positions[7]}  |  #{@positions[8]}  |  #{@positions[9]}  "
  end
end
