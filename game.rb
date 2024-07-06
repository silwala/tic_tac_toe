# frozen_string_literal: true

# class to make the game board
class Game
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  attr_accessor :occupied_spaces

  def initialize(player1, player2)
    @available_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @occupied_spaces = []
    @player1 = player1
    @player2 = player2
  end

  def occupy_space(space)
    raise ArgumentError, "Space #{space} not available" unless @available_spaces.include?(space)

    @occupied_spaces << space
  end
end
