#spec/queen_spec.rb
require "./lib/queen.rb"
require "./lib/board.rb"

describe LinearMoves do
  before(:each) do
    @board = Board.new
    @queen = Queen.new([3,3], "w_queen", @board)
  end

  describe "#straight_moves" do
    it "will return all possible moves a linear piece can do to the right" do
      expect(@queen.straight_moves[0]).to eql [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
    end

    it "will return all possible moves a linear piece can do to the left" do
      expect(@queen.straight_moves[1]).to eql [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
    end

    it "will return all possible moves a linear piece can do up" do
      expect(@queen.straight_moves[2]).to eql [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    end

    it "will return all possible moves a linear piece can do down" do
      expect(@queen.straight_moves[3]).to eql [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
    end
  end

  describe "#diagonal_moves" do
    it "will return all possible moves a bishop can do up and to the right" do
      expect(@queen.diagonal_moves[0]).to eql [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    end

    it "will return all possible moves a bishop can do up and to the left" do
      expect(@queen.diagonal_moves[1]).to eql [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
    end

    it "will return all possible moves a bishop can do down and to the right" do
      expect(@queen.diagonal_moves[2]).to eql [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
    end

    it "will return all possible moves a bishop can do down and to the left" do
      expect(@queen.diagonal_moves[3]).to eql [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
    end
  end


  describe "#get_possible_moves" do
    it "will return all possible moves a rook can do in a certain direction, given a certain board" do
      @rook = Rook.new([7,0], "w_rook", @board)
      @board.place_piece([7,4], @board.get_symbol("b_rook"))
      expect(@rook.get_possible_moves(@rook.MOVES[0])).to eql [[0, 1], [0, 2], [0, 3], [0, 4]]
    end

    it "will return all possible moves a bishop can do in a certain direction, given a certain board" do
      @bishop = Bishop.new([7,2], "w_bishop", @board)
      @board.place_piece([4,5], @board.get_symbol("b_rook"))
      expect(@bishop.get_possible_moves(@bishop.MOVES[0])).to eql [[-1, 1], [-2, 2], [-3, 3]]
    end
  end
end