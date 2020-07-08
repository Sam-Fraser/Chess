#spec/rook_spec.rb
require "./lib/rook.rb"
require "./lib/board.rb"

describe Rook do
  before(:each) do
    @board = Board.new
  end

  describe "#get_all_possible_moves" do
    it "will return all possible moves a rook can do in any direction, given a certain board" do
      @rook = Rook.new([3,3], "w_rook", @board)
      @board.place_piece([7,3], @board.get_symbol("w_king"))
      @board.place_piece([0,3], @board.get_symbol("b_pawn"))
      @board.place_piece([3,6], @board.get_symbol("b_rook"))
      @board.place_piece([3,1], @board.get_symbol("b_pawn"))
      expect(@rook.get_all_possible_moves).to eql [[0, 1], [0, 2], [0, 3], [0, -1], [0, -2], [-1, 0], [-2, 0], [-3, 0], [1, 0], [2, 0], [3, 0], [4, 0]]
    end
  end
end