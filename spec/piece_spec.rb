#spec/piece_spec.rb
require "./lib/piece.rb"
require "./lib/board.rb"

describe Piece do

  before(:each) do
    @board = Board.new
    @w_knight = Piece.new([0,1], "w_knight", @board)
  end

  describe "#move" do
    it "will move a piece to a new space" do
      @w_knight.move([2,1])
      expect(@w_knight.current_position).to eql [2,2]
    end

    it "will make first move false on a movement" do
      @w_knight.move([2,1])
      expect(@w_knight.first_move).to be false
    end

    it "will remove a piece from one space and place it in another" do
      DISPLAY3 = <<-DISPLAY
  a b c d e f g h 
1 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
2 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
3 \u{25A0} \u{25A1} \u{2658} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
4 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
5 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
6 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
7 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
8 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
      DISPLAY
      @w_knight.move([2,1])
      expect{ puts @board.display_board }.to output(DISPLAY3).to_stdout
    end
  end
end