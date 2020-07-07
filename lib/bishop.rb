#lib/bishop.rb
require_relative "piece.rb"

#bishop class (subclass of piece)
class Bishop < Piece
  attr_reader :UP_RIGHT_MOVES, :UP_LEFT_MOVES, :DOWN_RIGHT_MOVES, :DOWN_LEFT_MOVES

  def initialize(starting_position, name, board)
    super
    @UP_RIGHT_MOVES = up_right_moves
    @UP_LEFT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [arr[0], -arr[1]] }
    @DOWN_RIGHT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [-arr[0], arr[1]] }
    @DOWN_LEFT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [-arr[0], -arr[1]] }
  end

  #set_moves method
  def up_right_moves
    final_array = []
    7.times do |i|
      array = [-i-1,i+1]
      final_array.push(array)
    end
    final_array
  end

  #get possible moves method (per direction)
  def get_possible_moves(array)
    possible_moves = []
    array.each do |arr|
      if @board.valid_move?([@current_position[0] + arr[0], @current_position[1] + arr[1]])
        possible_moves.push(arr)
      elsif @board.valid_attack?([@current_position[0] + arr[0], @current_position[1] + arr[1]])
        possible_moves.push(arr)
        break
      end
    end
    possible_moves
  end

end