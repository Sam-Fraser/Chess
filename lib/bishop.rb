#lib/bishop.rb
require_relative "piece.rb"

#bishop class (subclass of piece)
class Bishop < Piece

  def initialize(starting_position, name, board)
    super
    @UP_RIGHT_MOVES = up_right_moves
    @UP_LEFT_MOVES = @RIGHT_MOVES.map { |arr| arr = [0, -arr[1]] }
    @DOWN_RIGHT_MOVES = @LEFT_MOVES.map { |arr| arr.reverse }
    @DOWN_LEFT_MOVES = @RIGHT_MOVES.map { |arr| arr.reverse }
  end

  #set_moves method
  def up_right_moves
    final_array = []
    7.times do |i|
      array = [i+1,i+1]
      final_array.push(array)
    end
    final_array.sort
  end
end