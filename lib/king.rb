#lib/king.rb
require_relative "piece.rb"
require_relative "set_moves.rb"

#king class (subclass of piece)
class King < Piece
  include SetMoves
  MOVES = [[1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1], [1,0]]

  #get all possible moves method
  def get_all_possible_moves
    get_set_moves(MOVES)
  end
end