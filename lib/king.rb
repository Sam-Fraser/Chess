#lib/king.rb
require_relative "piece.rb"

#king class (subclass of piece)
class King < Piece
  MOVES = [[1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1], [1,0]]

  #get all possible moves method
  def get_all_possible_moves
    possible_moves = []
    MOVES.each do |arr|
      move = [@current_position[0] + arr[0], @current_position[1] + arr[1]]
      possible_moves.push(arr) if @board.valid_move?(move) || @board.valid_attack?(move)
    end
    possible_moves
  end
end