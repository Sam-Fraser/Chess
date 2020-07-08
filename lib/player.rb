#lib/player.rb
Dir["./lib/*.rb"].each { |file| require file unless file == "./lib/player.rb" }

#player class
class Player
  attr_accessor :pieces, :board, :opponent

  #initialize with color, pieces array, board, opponent
  def initialize(color, board, opponent)
    @color = color
    @board = board
    @pieces = get_starting_pieces
    @opponent = opponent
  end

  #gets starting pieces and places them
  def get_starting_pieces
    pieces = []
    if @color == "white"
      pieces.push(
        Rook.new([7,0], "w_rook", @board),
        Knight.new([7,1], "w_knight", @board),
        Bishop.new([7,2], "w_bishop", @board),
        Queen.new([7,3], "w_queen", @board),
        King.new([7,4], "w_king", @board),
        Bishop.new([7,5], "w_bishop", @board),
        Knight.new([7,6], "w_knight", @board),
        Rook.new([7,7], "w_rook", @board)
      )
      8.times do |i|
        pieces.push(Pawn.new([6,i], "w_pawn", @board))
      end
    elsif @color == "black"
      pieces.push(
        Rook.new([7,0], "b_rook", @board),
        Knight.new([7,1], "b_knight", @board),
        Bishop.new([7,2], "b_bishop", @board),
        King.new([7,3], "b_king", @board),
        Queen.new([7,4], "b_queen", @board),
        Bishop.new([7,5], "b_bishop", @board),
        Knight.new([7,6], "b_knight", @board),
        Rook.new([7,7], "b_rook", @board)
      )
      8.times do |i|
        pieces.push(Pawn.new([6,i], "b_pawn", @board))
      end
    end
    pieces
  end

  #flip piece position (used with flip board)
  def flip_pieces
    @pieces.each do |piece|
      piece.swap_position
    end
  end

  #checks if piece is opponent piece
  def opponent_piece?(arr)
    @opponent.pieces.select { |piece| piece.current_position == arr }.length == 1
  end

  #get move method, asks for move 
  def get_move
    puts "Type in your move"
    puts "EX: d3 to d4 (include spaces)"
    move = gets.chomp.split(" ")
    move = [move[0], move[2]]
  end
end

