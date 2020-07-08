#lib/bishop.rb
require_relative "piece.rb"
require_relative "linear_moves.rb"

#bishop class (subclass of piece)
class Bishop < Piece
  attr_reader :MOVES
  include LinearMoves

  def initialize(starting_position, name, board)
    super
    @MOVES = diagonal_moves
  end

  #get all possible moves method
  def get_all_possible_moves
    possible_moves = []
    @MOVES.each do |arr|
      possible_moves += get_possible_moves(arr)
    end
    possible_moves
  end
end