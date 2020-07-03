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
      Array.new(8, {base: "", piece: ""})
    end
    board
  end
end