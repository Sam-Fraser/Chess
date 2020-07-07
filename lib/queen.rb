#lib/queen.rb
require_relative "piece.rb"

#rook class (subclass of piece)
class Queen < Piece
  attr_reader :RIGHT_MOVES, :LEFT_MOVES, :UP_MOVES, :DOWN_MOVES

  def initialize(starting_position, name, board)
    super
    @RIGHT_MOVES = right_moves
    @LEFT_MOVES = @RIGHT_MOVES.map { |arr| arr = [0, -arr[1]] }
    @UP_MOVES = @LEFT_MOVES.map { |arr| arr.reverse }
    @DOWN_MOVES = @RIGHT_MOVES.map { |arr| arr.reverse }
    @UP_RIGHT_MOVES = up_right_moves
    @UP_LEFT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [arr[0], -arr[1]] }
    @DOWN_RIGHT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [-arr[0], arr[1]] }
    @DOWN_LEFT_MOVES = @UP_RIGHT_MOVES.map { |arr| arr = [-arr[0], -arr[1]] }
  end

  #set_straight_moves method
  def right_moves
    final_array = []
    7.times do |i|
      array = [0,i+1]
      final_array.push(array)
    end
    final_array.sort
  end

  #set_diagonal_moves method
  def up_right_moves
    final_array = []
    7.times do |i|
      array = [-i-1,i+1]
      final_array.push(array)
    end
    final_array
  end

  #possible moves method
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

  #get all possible moves method
  def get_all_possible_moves
    possible_moves = []
    possible_moves += get_possible_moves(@RIGHT_MOVES)
    possible_moves += get_possible_moves(@LEFT_MOVES)
    possible_moves += get_possible_moves(@UP_MOVES)
    possible_moves += get_possible_moves(@DOWN_MOVES)
    possible_moves += get_possible_moves(@UP_RIGHT_MOVES)
    possible_moves += get_possible_moves(@UP_LEFT_MOVES)
    possible_moves += get_possible_moves(@DOWN_RIGHT_MOVES)
    possible_moves += get_possible_moves(@DOWN_LEFT_MOVES)
    possible_moves
  end
end