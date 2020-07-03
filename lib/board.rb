#lib/board.rb
require_relative "symbols.rb"

#board class for all functions related to the gameboard
class Board
  include Symbols
  attr_accessor :board

  #initialize board
  def initialize
    @board = starting_board
  end

  #create starting board
  def starting_board
    board = create_board
    board.each do |arr|
      arr.each
    end
  end

  #create board
  def create_board
    board = Array.new(8).map do |x|
      Array.new(8).map { |x| {base: "", piece: ""} }
    end
    board
  end

  #set base values for board
  def set_base_vals(board)
    i = 0
    board.each do |arr|
      arr.each_with_index do |hash, idx|
        x = idx + i
        x.even? ? hash[:base] = get_symbol("w_board") : hash[:base] = get_symbol("b_board")
      end
      i += 1
    end
  end
end