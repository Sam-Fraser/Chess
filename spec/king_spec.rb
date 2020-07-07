#spec/king_spec.rb
require "./lib/king.rb"
require "./lib/board.rb"

describe King do
  before(:each) do
    @board = Board.new
    @king = King.new([3,3], "w_queen", @board)
  end

  describe "#get_all_possible_moves" do
    it "will return all moves around it if they're all valid" do
      expect(@king.get_all_possible_moves).to eql [[1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1], [1,0]]
    end

    it "will return all moves around it even if they're occupied" do
      @board.place_piece([5,4], @board.get_symbol("b_queen"))
      @board.place_piece([4,5], @board.get_symbol("b_bishop"))
      @board.place_piece([2,1], @board.get_symbol("b_rook"))
      @board.place_piece([1,2], @board.get_symbol("b_knight"))
      expect(@king.get_all_possible_moves).to eql [[1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1], [1,0]]
    end

    it "will only return moves on the board" do
      @king.move([-3,-3])
      expect(@king.get_all_possible_moves).to eql [[1, 1], [0, 1], [1, 0]]
    end
  end

end