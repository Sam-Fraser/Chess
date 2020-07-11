#lib/player.rb
Dir["./lib/*.rb"].each { |file| require file unless file == "./lib/player.rb" }

#player class
class Player
  include Spaces
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
    pieces = {}
    if @color == "white"
      pieces[:q_rook] = Rook.new([7,0], "w_rook", @board)
      pieces[:q_knight] = Knight.new([7,1], "w_knight", @board)
      pieces[:q_bishop] = Bishop.new([7,2], "w_bishop", @board)
      pieces[:queen] = Queen.new([7,3], "w_queen", @board)
      pieces[:king] = King.new([7,4], "w_king", @board)
      pieces[:k_bishop] = Bishop.new([7,5], "w_bishop", @board)
      pieces[:k_knight] = Knight.new([7,6], "w_knight", @board)
      pieces[:k_rook] = Rook.new([7,7], "w_rook", @board)
      8.times do |i|
        key = "pawn#{i}"
        pieces[key.to_sym] = Pawn.new([6,i], "w_pawn", @board)
      end
    elsif @color == "black"
      pieces[:k_rook] = Rook.new([7,0], "b_rook", @board)
      pieces[:k_knight] = Knight.new([7,1], "b_knight", @board)
      pieces[:k_bishop] = Bishop.new([7,2], "b_bishop", @board)
      pieces[:king] = King.new([7,3], "b_king", @board)
      pieces[:queen] = Queen.new([7,4], "b_queen", @board)
      pieces[:q_bishop] = Bishop.new([7,5], "b_bishop", @board)
      pieces[:q_knight] = Knight.new([7,6], "b_knight", @board)
      pieces[:q_rook] = Rook.new([7,7], "b_rook", @board)
      8.times do |i|
        key = "pawn#{i}"
        pieces[key.to_sym] = Pawn.new([6,i], "b_pawn", @board)
      end
    end
    pieces
  end

  #flip piece position (used with flip board)
  def flip_pieces
    @pieces.each_value do |piece|
      piece.swap_position
    end
  end

  #checks if piece is opponent piece
  def opponent_piece?(arr)
    @opponent.pieces.select { |piece| @opponent.pieces[piece] == @board.board[arr[0]][arr[1]][:piece] }.length == 1
  end

  #get piece method (finds piece at certain spot)
  def get_piece(arr)
    @pieces.select { |piece| @pieces[piece].current_position == arr}.flatten[1]
  end

  #get move method, asks for move 
  def get_move
    loop do
      puts "Type in your move"
      puts "EX: d3 to d4 (include spaces), or kingside/queenside castle"
      move = gets.chomp.downcase.split(" ")
      if move.include?("castle")
        if move.include?("kingside") 
          self.kingside_castle ? break : next
        elsif move.include?("queenside")
          self.queenside_castle ? break : next
        end
      else
        move = [get_space(move[0]), get_space(move[2])]
        piece = nil
        @board.valid_attack?(move[0]) ? piece = self.get_piece(move[0]) : next
        pieces.value?(piece) ? movement = [move[1][0] - piece.current_position[0], move[1][1] - piece.current_position[1]] : next
        if piece.get_all_possible_moves.include?(movement) && (self.opponent_piece?(move[1]) || @board.valid_move?(move[1]))
          piece.move(movement)
          break
        else
          puts "You can't move there"
        end
      end
    end
  end

  #kingside castle method 
  def kingside_castle
    if @color == "white" && @pieces[:king].first_move && @pieces[:k_rook].first_move && @board.board[7][5][:piece].nil? && @board.board[7][6][:piece].nil?
      @pieces[:king].move([0,2])
      @pieces[:k_rook].move([0,-2])
      true
    elsif @color == "black" && @pieces[:king].first_move && @pieces[:k_rook].first_move && @board.board[7][2][:piece].nil? && @board.board[7][1][:piece].nil?
      @pieces[:king].move([0,-2])
      @pieces[:k_rook].move([0,2])
      true
    else
      puts "You cannot castle now"
      false
    end
  end

  #queenside castle method 
  def queenside_castle
    if @color == "white" && @pieces[:king].first_move && @pieces[:q_rook].first_move && @board.board[7][1][:piece].nil? && @board.board[7][2][:piece].nil? && @board.board[7][3][:piece].nil?
      @pieces[:king].move([0,-2])
      @pieces[:q_rook].move([0,3])
      true
    elsif @color == "black" && @pieces[:king].first_move && @pieces[:q_rook].first_move && @board.board[7][4][:piece].nil? && @board.board[7][5][:piece].nil? && @board.board[7][6][:piece].nil?
      @pieces[:king].move([0,2])
      @pieces[:q_rook].move([0,-3])
      true
    else
      puts "You cannot castle now"
      false
    end
  end
end