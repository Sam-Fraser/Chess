#spec/piece_spec.rb
require "./lib/piece.rb"

describe Piece do

  before(:each) do
    @w_knight = Piece.new([0,1], "w_knight")
  end

  describe "#move" do
    it "will move a piece to a new space" do
      @w_knight.move([2,1])
      expect(@w_knight.current_position).to eql [2,2]
    end

    it "will make first move false on a movement" do
      @w_knight.move([2,1])
      expect(@w_knight.first_move).to be false
    end
  end
end