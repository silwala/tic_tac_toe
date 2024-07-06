# frozen_string_literal: true

# class to create a player object
class Player
  attr_reader :name, :symbol
  attr_accessor :choice

  def symbol=(new_symbol)
    raise ArgumentError, "invalid symbol: #{new_symbol}" unless %w[X O].include?(new_symbol)

    @symbol = new_symbol
  end

  def initialize(name, symbol)
    @name = name
    self.symbol = symbol
  end
end
