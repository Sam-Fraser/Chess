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
          promotion(piece)
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
      results_in_check?([0,2]) ? false : @pieces[:king].move([0,2])
      @pieces[:k_rook].move([0,-2])
      true
    elsif @color == "black" && @pieces[:king].first_move && @pieces[:k_rook].first_move && @board.board[7][2][:piece].nil? && @board.board[7][1][:piece].nil?
      results_in_check?([0,-2]) ? false : @pieces[:king].move([0,-2])
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
      results_in_check?([0,-2]) ? false : @pieces[:king].move([0,-2])
      @pieces[:q_rook].move([0,3])
      true
    elsif @color == "black" && @pieces[:king].first_move && @pieces[:q_rook].first_move && @board.board[7][4][:piece].nil? && @board.board[7][5][:piece].nil? && @board.board[7][6][:piece].nil?
      results_in_check?([0,2]) ? false : @pieces[:king].move([0,2])
      @pieces[:q_rook].move([0,-3])
      true
    else
      puts "You cannot castle now"
      false
    end
  end

  #promotion class for pawns
  def promotion(piece)
    if piece.is_a?(Pawn) && piece.current_position[0] == 0 
      loop do
        puts "What would you like to promote your pawn to?"
        puts "Type the full name: (knight, rook, bishop, queen)"
        promoted_to = gets.chomp.downcase
        case promoted_to
        when "queen"
          pieces[pieces.key(piece)] = Queen.new(piece.current_position, "#{@color[0]}_queen", @board)
          break
        when "knight"
          pieces[pieces.key(piece)] = Knight.new(piece.current_position, "#{@color[0]}_queen", @board)
          break
        when "rook"
          pieces[pieces.key(piece)] = Rook.new(piece.current_position, "#{@color[0]}_queen", @board)
          break
        when "bishop"
          pieces[pieces.key(piece)] = Bishop.new(piece.current_position, "#{@color[0]}_queen", @board)
          break
        else
          puts "that is not a valid selection"
          next
        end
      end
    end
  end

  #returns true if opponent is in check
  def check?
    opponent_king = @opponent.pieces[:king]
    attackers = @pieces.select do |piece|
      @pieces[piece].get_all_possible_moves.any? do |move|        
        [@pieces[piece].current_position[0] + move[0], @pieces[piece].current_position[1] + move[1]] == opponent_king.current_position
      end
    end
    !attackers.empty?
  end

  #returns true if move will result in check
  def results_in_check?(move)
    king = @pieces[:king]
    potential_pos = [king.current_position[0] + move[0], king.current_position[1] + move[1]]
    attackers = @opponent.pieces.select do |piece|
      @opponent.pieces[piece].get_all_possible_moves.any? do |move|        
        [@opponent.pieces[piece].current_position[0] + move[0], @opponent.pieces[piece].current_position[1] + move[1]] == potential_pos
      end
    end
    !attackers.empty?
  end

  #returns true if opponent is in check mate
  def check_mate?
    opponent_king = @opponent.pieces[:king]
    king_moves = opponent_king.get_all_possible_moves
    if check? && king_moves.all? { |moves| results_in_check(move) }
      true
    else
      false
    end
  end
end