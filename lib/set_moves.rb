#lib/set_moves.rb

module SetMoves
  def get_set_moves(array)
    possible_moves = []
    array.each do |arr|
      move = [@current_position[0] + arr[0], @current_position[1] + arr[1]]
      possible_moves.push(arr) if @board.valid_move?(move) || @board.valid_attack?(move)
    end
    possible_moves
  end
end