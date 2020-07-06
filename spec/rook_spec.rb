#spec/rook_spec.rb
require "./lib/rook.rb"
require "./lib/board.rb"

describe Rook do
  before(:each) do
    @board = Board.new
    @rook = Rook.new([7,0], "w_rook", @board)
  end

  describe "#all_moves" do
    it "will return all possible moves a rook can do" do
      expect(@rook.all_moves).to eql [[0,1], [1,0], [0,-1], [-1,0], [0,2], [2,0], [0,-2], [-2,0], [0,3], [3,0], [0,-3], [-3,0], [0,4], [4,0], [0,-4], [-4,0], [0,5], [5,0], [0,-5], [-5,0], [0,6], [6,0], [0,-6], [-6,0], [0,7], [7,0], [0,-7], [-7,0]]
    end
  end
end