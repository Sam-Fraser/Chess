#spec/bishop_spec.rb
require "./lib/bishop.rb"
require "./lib/board.rb"

describe Bishop do
  before(:each) do
    @board = Board.new
  end

  describe "#get_all_possible_moves" do
    it "will return all possible moves a bishop can do in any direction, given a certain board" do
      @bishop = Bishop.new([3,3], "w_bishop", @board)
      @board.place_piece([1,1], @board.get_symbol("w_king"))
      @board.place_piece([5,5], @board.get_symbol("b_pawn"))
      @board.place_piece([1,5], @board.get_symbol("b_rook"))
      @board.place_piece([5,1], @board.get_symbol("b_pawn"))
      expect(@bishop.get_all_possible_moves).to eql [[-1, 1], [-2, 2], [-1, -1], [-2, -2], [1, 1], [2, 2], [1, -1], [2, -2]]
    end
  end
end