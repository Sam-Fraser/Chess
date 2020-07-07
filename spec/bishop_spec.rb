#spec/bishop_spec.rb
require "./lib/bishop.rb"
require "./lib/board.rb"

describe Bishop do
  before(:each) do
    @board = Board.new
    @bishop = Bishop.new([7,2], "w_bishop", @board)
  end

  describe "#up_right_moves" do
    it "will return all possible moves a bishop can do up and to the right" do
      expect(@bishop.up_right_moves).to eql [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    end
  end

  describe "#UP_LEFT_MOVES" do
    it "will return all possible moves a bishop can do up and to the left" do
      expect(@bishop.UP_LEFT_MOVES).to eql [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
    end
  end

  describe "#DOWN_RIGHT_MOVES" do
    it "will return all possible moves a bishop can do down and to the right" do
      expect(@bishop.DOWN_RIGHT_MOVES).to eql [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
    end
  end

  describe "#DOWN_LEFT_MOVES" do
    it "will return all possible moves a bishop can do down and to the left" do
      expect(@bishop.DOWN_LEFT_MOVES).to eql [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
    end
  end

  describe "#get_possible_moves" do
    it "will return all possible moves a bishop can do in a certain direction, given a certain board" do
      @board.place_piece([4,5], @board.get_symbol("b_rook"))
      expect(@bishop.get_possible_moves(@bishop.UP_RIGHT_MOVES)).to eql [[-1, 1], [-2, 2], [-3, 3]]
    end
  end
end