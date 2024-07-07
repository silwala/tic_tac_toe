# frozen_string_literal: true

# class to make the game board
class Game
  def initialize(player1, player2)
    @positions = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    @player1 = player1
    @player2 = player2
    @game_over = false
  end

  def occupy_space
    puts 'Enter the row of the position you want to occupy'
    row = gets.chomp.to_i - 1
    puts 'Enter the column of the position you want to occupy'
    column = gets.chomp.to_i - 1
    raise StandardError, 'Invalid row, enter a number between 1 and 3' if row.nil? || !row.between?(0, 2)
    raise StandardError, 'Invalid column, enter a number' if column.nil? || !column.between?(0, 2)
    raise StandardError, "The position #{row}X#{column} is already occupied" unless @positions[row][column] == ' '

    @positions[row][column] = @current_player.symbol
  end

  def position_input
    is_valid = false
    until is_valid
      begin
        occupy_space
      rescue StandardError => e
        puts e.message
      else
        is_valid = true
      end
    end
  end

  def play
    @current_player = @player1
    until @game_over
      puts "#{@current_player.name}'s turn - #{@current_player.symbol}'"
      draw_board
      position_input
      check_winner
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  end

  def draw_board
    puts "  #{@positions[0][0]}  |  #{@positions[0][1]}  |  #{@positions[0][2]}  "
    puts '_______________'
    puts "  #{@positions[1][0]}  |  #{@positions[1][1]}  |  #{@positions[1][2]}  "
    puts '________________'
    puts "  #{@positions[2][0]}  |  #{@positions[2][1]}  |  #{@positions[2][2]}  "
  end

  def check_winner
    game_won = check_by_row || check_diagonal || check_by_column
    return unless game_won

    @game_over = true
    draw_board
    puts "#{@current_player.name} won!"
  end

  def check_by_row
    @positions.any? do |row|
      row.all? { |column| column != ' ' } && row.uniq.length == 1
    end
  end

  def check_diagonal
    return false if @positions[1][1] == ' '

    (@positions[1][1] == @positions[2][2] && @positions[1][1] == @positions[0][0]) ||
      (@positions[1][1] == @positions[0][2] && @positions[1][1] == @positions[2][0])
  end

  def check_by_column
    first_row = @positions[0]
    (0..@positions.length - 1).any? do |column|
      @positions.all? { |row| row[column] == first_row[column] && first_row[column] != ' '}
    end
  end

end
