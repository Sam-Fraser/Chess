#spec/pawn_spec.rb
require "./lib/pawn.rb"
require "./lib/board.rb"

describe Pawn do
  before(:each) do
    @board = Board.new
    @pawn = Pawn.new([6,0], "w_pawn", @board)
  end

  describe "#get_possible_moves" do
    it "will return only initial move values for a pawn" do
      expect(@pawn.get_possible_moves).to eql [[-1,0], [-2,0]]
    end

    it "will return only regular move values if pawn has moved before" do
      @pawn.move([-2,0])
      expect(@pawn.get_possible_moves).to eql [[-1,0]]
    end

    it "will return attack moves if another piece is in attack range" do
      @pawn.move([-2,0])
      @board.place_piece([3,1], @board.get_symbol("b_knight"))
      expect(@pawn.get_possible_moves).to eql [[-1,0], [-1,1]]
    end

    it "will return no moves if piece is in front of it" do
      @board.place_piece([5,0], @board.get_symbol("w_knight"))
      expect(@pawn.get_possible_moves).to eql []
    end

    it "will return the space in front of it if piece is blocking special first move" do
      @board.place_piece([4,0], @board.get_symbol("b_pawn"))
      expect(@pawn.get_possible_moves).to eql [[-1,0]]
    end
  end
end