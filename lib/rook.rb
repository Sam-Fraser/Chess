#lib/rook.rb
require_relative "piece.rb"
require_relative "linear_moves.rb"

#rook class (subclass of piece)
class Rook < Piece
  attr_reader :MOVES
  include LinearMoves

  def initialize(starting_position, name, board)
    super
    @MOVES = straight_moves
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