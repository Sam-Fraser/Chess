#spec/rook_spec.rb
require "./lib/rook.rb"
require "./lib/board.rb"

describe Rook do
  before(:each) do
    @board = Board.new
    @rook = Rook.new([7,0], "w_rook", @board)
  end

  describe "#right_moves" do
    it "will return all possible moves a rook can do to the right" do
      expect(@rook.right_moves).to eql [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
    end
  end

  describe "#LEFT_MOVES" do
    it "will return all possible moves a rook can do to the left" do
      expect(@rook.LEFT_MOVES).to eql [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
    end
  end

  describe "#UP_MOVES" do
    it "will return all possible moves a rook can do up" do
      expect(@rook.UP_MOVES).to eql [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    end
  end

  describe "#DOWN_MOVES" do
    it "will return all possible moves a rook can do down" do
      expect(@rook.DOWN_MOVES).to eql [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
    end
  end

  describe "#get_possible_moves" do
    it "will return all possible moves a rook can do in a certain direction, given a certain board" do
      @board.place_piece([7,4], @board.get_symbol("b_rook"))
      expect(@rook.get_possible_moves(@rook.RIGHT_MOVES)).to eql [[0, 1], [0, 2], [0, 3], [0, 4]]
    end
  end

  describe "#get_all_possible_moves" do
    it "will return all possible moves a rook can do in any direction, given a certain board" do
      @rook2 = Rook.new([3,3], "w_rook", @board)
      @board.place_piece([7,3], @board.get_symbol("w_king"))
      @board.place_piece([0,3], @board.get_symbol("b_pawn"))
      @board.place_piece([3,6], @board.get_symbol("b_rook"))
      @board.place_piece([3,1], @board.get_symbol("b_pawn"))
      expect(@rook2.get_all_possible_moves).to eql [[0, 1], [0, 2], [0, 3], [0, -1], [0, -2], [-1, 0], [-2, 0], [-3, 0], [1, 0], [2, 0], [3, 0], [4, 0]]
    end
  end
end