#lib/linear_moves.rb

module LinearMoves

  #set_straight_right_moves method
  def straight_moves
    final_array = []
    right_array = []
    7.times do |i|
      array = [0,i+1]
      right_array.push(array)
    end
    right_array.sort!
    left_array = right_array.map { |arr| arr = [0, -arr[1]] }
    up_array = left_array.map { |arr| arr.reverse }
    down_array = right_array.map { |arr| arr.reverse }
    final_array.push(right_array, left_array, up_array, down_array)
    final_array
  end

  #set_up_right_diagonal_moves method
  def diagonal_moves
    final_array = []
    up_right = []
    7.times do |i|
      array = [-i-1,i+1]
      up_right.push(array)
    end
    up_left = up_right.map { |arr| arr = [arr[0], -arr[1]] }
    down_right = up_right.map { |arr| arr = [-arr[0], arr[1]] }
    down_left = up_right.map { |arr| arr = [-arr[0], -arr[1]] }
    final_array.push(up_right, up_left, down_right, down_left)
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

end