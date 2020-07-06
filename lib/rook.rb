#lib/rook.rb
require_relative "piece.rb"

#rook class (subclass of piece)
class Rook < Piece
  attr_reader :LEFT_MOVES, :UP_MOVES, :DOWN_MOVES

  def initialize(starting_position, name, board)
    super
    @RIGHT_MOVES = right_moves
    @LEFT_MOVES = @RIGHT_MOVES.map { |arr| arr = [0, -arr[1]] }
    @UP_MOVES = @LEFT_MOVES.map { |arr| arr.reverse }
    @DOWN_MOVES = @RIGHT_MOVES.map { |arr| arr.reverse }
  end
  #set_moves method
  def right_moves
    final_array = []
    7.times do |i|
      array = [0,i+1]
      final_array.push(array)
    end
    final_array.sort
  end

  #possible moves method
  def get_possible_moves
    possible_moves = []
    
  end
end