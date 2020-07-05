#lib/board.rb
require_relative "symbols.rb"

#board class for all functions related to the gameboard
class Board
  include Symbols
  attr_accessor :board

  #initialize board
  def initialize
    @board = set_base_vals(create_board)
  end

  #create board
  def create_board
    board = Array.new(8).map do |x|
      Array.new(8).map { |x| {base: nil, piece: nil} }
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

  #places piece at specific spot on board
  def place_piece(arr, piece)
    @board[arr[0]][arr[1]][:piece] = piece
  end

  #removes piece at specific spot on board
  def remove_piece(arr)
    @board[arr[0]][arr[1]][:piece] = nil
  end

  #check if space to move to is a valid move
  def valid_move?(arr)
    arr[0] > 0 && arr[0] < 7 && arr[1] > 0 && arr[1] < 7 && @board[arr[0]][arr[1]][:piece].nil?
  end

  #flips board
  def flip_board
    @board.each do |arr|
      arr.reverse!
    end
    @board.reverse!
  end

  #display board method for clean display in command line
  def display_board
    display = "  a b c d e f g h \n"
    @board.each_with_index do |arr, i|
      line = "#{i + 1} "
      arr.each do |hash|
        hash[:piece].nil? ? line += "#{hash[:base]} " : line += "#{hash[:piece]} "
      end
      line += "\n"
      display += line
    end
    display
  end

end