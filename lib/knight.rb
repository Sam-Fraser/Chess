#lib/knight.rb
require_relative "piece.rb"

#knight class (subclass of piece)
class Knight
  MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]

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