#spec/knight_spec.rb
require "./lib/knight.rb"
require "./lib/board.rb"

describe Knight do
  before(:each) do
    @board = Board.new
    @knight = Knight.new([3,3], "w_knight", @board)
  end

  describe "#get_all_possible_moves" do
    it "will return all moves around it if they're all valid" do
      expect(@knight.get_all_possible_moves).to eql [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
    end

    it "will return all moves around it even if they're occupied" do
      @board.place_piece([5,4], @board.get_symbol("b_queen"))
      @board.place_piece([4,5], @board.get_symbol("b_bishop"))
      @board.place_piece([2,1], @board.get_symbol("b_rook"))
      @board.place_piece([1,2], @board.get_symbol("b_knight"))
      expect(@knight.get_all_possible_moves).to eql [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
    end

    it "will only return moves on the board" do
      @knight.move([-3,-3])
      expect(@knight.get_all_possible_moves).to eql [[2, 1], [1, 2]]
    end
  end
end