#spec/bishop_spec.rb
require "./lib/bishop.rb"
require "./lib/board.rb"

describe Bishop do
  before(:each) do
    @board = Board.new
    @bishop = Bishop.new([7,2], "w_bishop", @board)
  end

  describe "#up_right_moves" do
    it "will return all possible moves a rook can do up and to the right" do
      expect(@bishop.up_right_moves).to eql [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
    end
  end

end