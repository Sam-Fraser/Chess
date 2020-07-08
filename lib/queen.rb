#lib/queen.rb
require_relative "piece.rb"
require_relative "linear_moves.rb"

#queen class (subclass of piece)
class Queen < Piece
  attr_reader :RIGHT_MOVES, :LEFT_MOVES, :UP_MOVES, :DOWN_MOVES
  include LinearMoves

  def initialize(starting_position, name, board)
    super
    @STRAIGHT_MOVES = straight_moves
    @DIAGONAL_MOVES = diagonal_moves
  end

  #get all possible moves method
  def get_all_possible_moves
    possible_moves = []
    @STRAIGHT_MOVES.each do |arr|
      possible_moves += get_possible_moves(arr)
    end
    @DIAGONAL_MOVES.each do |arr|
      possible_moves += get_possible_moves(arr)
    end
    possible_moves
  end
end