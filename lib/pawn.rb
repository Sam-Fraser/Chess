#lib/pawn.rb
require_relative "piece.rb"

#pawn class (subclass of piece)
class Pawn < Piece
  INIT_MOVES = [[-2,0],[-1,0]]
  MOVES = [[-1,0]]
  ATTACKS = [[-1,1],[-1,-1]]

  #
end