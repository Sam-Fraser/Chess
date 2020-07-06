#lib/piece.rb
require_relative "symbols.rb"

#parent class for all pieces
class Piece
  include(Symbols)
  attr_reader :name, :current_position, :first_move

  #initialize with current_position, name, first_move boolean
  def initialize(starting_position, name, board)
    @current_position = starting_position
    @name = get_symbol(name)
    @board = board
    @board.place_piece(@current_position, @name)
    @first_move = true
  end

  #general move piece method
  def move(movement)
    possible_position = [@current_position[0] + movement[0], @current_position[1] + movement[1]]
    if @board.valid_move?(possible_position) || @board.valid_attack?(possible_position)
      @first_move = false
      @board.remove_piece(@current_position)
      @current_position = possible_position
      @board.place_piece(@current_position, @name)
    end
    nil
  end

  #swap position method for turn changes
  def swap_position
    @current_position = [7 - @current_position[0], 7 - @current_position[1]]
  end
end