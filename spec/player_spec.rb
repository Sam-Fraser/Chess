#spec/player_spec.rb
require "./lib/player.rb"

describe Player do
  before(:each) do
    @board = Board.new
    @player2 = Player.new("black", @board, "player1")
    @board.flip_board
    @player2.flip_pieces
    @player1 = Player.new("white", @board, @player2)
    @player2.opponent = @player1
  end

  describe "#get_starting_pieces" do
    it "will return a fully set starting board" do
      OUTPUT = <<~OUTPUT
      a b c d e f g h 
    1 \u{2656} \u{2658} \u{2657} \u{2655} \u{2654} \u{2657} \u{2658} \u{2656} 
    2 \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} 
    3 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    4 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    5 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    6 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    7 \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} 
    8 \u{265C} \u{265E} \u{265D} \u{265B} \u{265A} \u{265D} \u{265E} \u{265C} 
      OUTPUT

      puts @board.display_board
      expect{ puts @board.display_board }.to output(OUTPUT).to_stdout
    end
  end

  describe "#opponent_piece?" do
    it "will return true if the opponent has a piece in that space" do
      expect(@player1.opponent_piece?([0,0])).to be true
    end

    it "will return false if the opponent does not have a piece in that space" do
      expect(@player2.opponent_piece?([3,3])).to be false
    end
  end

  describe "#get_piece" do
    it "will return the piece at a certain spot on the board" do
      knight = @player1.get_piece([7,1])
      expect(knight.is_a?(Knight)).to be true
    end
  end

  describe "#kingside_castle" do
    it "will move the white king and kingside rook to the correct places" do
      @player1.pieces[:k_knight].move([-2,1])
      @player1.pieces[:k_bishop].move([-2,0])
      @player1.kingside_castle
      expect(@player1.pieces[:king].current_position).to eql([7,6])
    end

    it "will move the black king and kingside rook to the correct places" do
      @board.flip_board
      @player2.flip_pieces
      @player1.flip_pieces
      @player2.pieces[:k_knight].move([-2,-1])
      @player2.pieces[:k_bishop].move([-2,0])
      @player2.kingside_castle
      expect(@player2.pieces[:king].current_position).to eql([7,1])
    end
  end

  describe "#queenside_castle" do
    it "will move the white king and queensside rook to the correct places" do
      @player1.pieces[:q_knight].move([-2,-1])
      @player1.pieces[:q_bishop].move([-2,0])
      @player1.pieces[:queen].move([-3,0])
      @player1.queenside_castle
      expect(@player1.pieces[:king].current_position).to eql([7,2])
    end

    it "will move the black king and kingside rook to the correct places" do
      @board.flip_board
      @player2.flip_pieces
      @player1.flip_pieces
      @player2.pieces[:q_knight].move([-2,1])
      @player2.pieces[:q_bishop].move([-2,0])
      @player2.pieces[:queen].move([-3,0])
      @player2.queenside_castle
      expect(@player2.pieces[:king].current_position).to eql([7,5])
    end
  end

  describe "#get_move" do
    it "will prompt the user to input a move" do
      ASK = <<~ASK
      Type in your move
      EX: d3 to d4 (include spaces), or kingside/queenside castle
      ASK
      allow_any_instance_of(Player).to receive(:gets).and_return('d7 to d5')
      expect{ @player1.get_move }.to output(ASK).to_stdout
    end

    it "will move a piece to a specified space" do
      allow_any_instance_of(Player).to receive(:gets).and_return('d7 to d5')
      @player1.get_move
      expect(@player1.pieces[:pawn3].current_position).to eql([4,3])
    end
  end

  describe "#promotion" do
    it "will prompt the user to input a promotion" do
      ASK2 = <<~ASK
        What would you like to promote your pawn to?
        Type the full name: (knight, rook, bishop, queen)
      ASK
      allow_any_instance_of(Player).to receive(:gets).and_return("queen")
      @player1.pieces[:pawn3].move([-6,0])
      expect{ @player1.promotion(@player1.pieces[:pawn3]) }.to output(ASK2).to_stdout
    end

    it "will convert the pawn to a queen when 'queen' is input" do
      allow_any_instance_of(Player).to receive(:gets).and_return("queen")
      @player1.pieces[:pawn3].move([-6,0])
      @player1.promotion(@player1.pieces[:pawn3])
      expect(@player1.pieces[:pawn3].is_a?(Queen)).to be true
    end

    it "will convert the pawn to a knight when 'knight' is input" do
      allow_any_instance_of(Player).to receive(:gets).and_return("knight")
      @player1.pieces[:pawn3].move([-6,0])
      @player1.promotion(@player1.pieces[:pawn3])
      expect(@player1.pieces[:pawn3].is_a?(Knight)).to be true
    end

    it "will convert the pawn to a rook when 'rook' is input" do
      allow_any_instance_of(Player).to receive(:gets).and_return("rook")
      @player1.pieces[:pawn3].move([-6,0])
      @player1.promotion(@player1.pieces[:pawn3])
      expect(@player1.pieces[:pawn3].is_a?(Rook)).to be true
    end

    it "will convert the pawn to a bishop when 'bishop' is input" do
      allow_any_instance_of(Player).to receive(:gets).and_return("bishop")
      @player1.pieces[:pawn3].move([-6,0])
      @player1.promotion(@player1.pieces[:pawn3])
      expect(@player1.pieces[:pawn3].is_a?(Bishop)).to be true
    end
  end
end 