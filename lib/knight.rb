#lib/knight.rb
require_relative "piece.rb"
require_relative "set_moves.rb"

#knight class (subclass of piece)
class Knight < Piece
  include SetMoves
  MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]

  #get all possible moves method
  def get_all_possible_moves
    get_set_moves(MOVES)
  end
end