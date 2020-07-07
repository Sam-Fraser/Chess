#spec/queen_spec.rb
require "./lib/queen.rb"
require "./lib/board.rb"

describe Queen do
  before(:each) do
    @board = Board.new
    @queen = Queen.new([3,3], "w_queen", @board)
  end

  describe "#get_all_possible_moves" do
    it "will return all possible moves a queen can do in any direction, given a certain board" do
      @board.place_piece([7,3], @board.get_symbol("w_king"))
      @board.place_piece([0,3], @board.get_symbol("b_pawn"))
      @board.place_piece([3,6], @board.get_symbol("b_rook"))
      @board.place_piece([3,1], @board.get_symbol("b_pawn"))
      @board.place_piece([1,1], @board.get_symbol("w_bishop"))
      @board.place_piece([5,5], @board.get_symbol("b_pawn"))
      @board.place_piece([1,5], @board.get_symbol("b_rook"))
      @board.place_piece([5,1], @board.get_symbol("b_pawn"))
      expect(@queen.get_all_possible_moves).to eql [[0, 1], [0, 2], [0, 3], [0, -1], [0, -2], [-1, 0], [-2, 0], [-3, 0], [1, 0], [2, 0], [3, 0], [4, 0], [-1, 1], [-2, 2], [-1, -1], [-2, -2], [1, 1], [2, 2], [1, -1], [2, -2]]
    end
  end
end