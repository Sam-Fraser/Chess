#lib/pawn.rb
require_relative "piece.rb"

#pawn class (subclass of piece)
class Pawn < Piece
  INIT_MOVES = [[-1,0],[-2,0]]
  MOVES = [-1,0]
  ATTACKS = [[-1,1],[-1,-1]]

  #get possible moves
  def get_all_possible_moves
    possible_moves = Array.new
    if first_move
      INIT_MOVES.each do |arr|
        @board.valid_move?([@current_position[0] + arr[0], @current_position[1] + arr[1]]) ? possible_moves.push(arr) : break 
      end
    else
      possible_moves.push(MOVES) if @board.valid_move?([@current_position[0] + MOVES[0], @current_position[1] + MOVES[1]])
    end
    ATTACKS.each do |arr| 
      @board.valid_attack?([@current_position[0] + arr[0], @current_position[1] + arr[1]]) ? possible_moves.push(arr) : next 
    end
    possible_moves
  end
end