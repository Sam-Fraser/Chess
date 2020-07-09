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
end