#spec/board_spec.rb
require "./lib/board.rb"

describe Board do
  describe "#create_board" do
    it "will return an array of length 8" do
      board = Board.new
      expect(board.create_board.length).to eql 8
    end

    it "will contain 8 arrays of length 8" do
      board = Board.new
      game_board = board.create_board
      expect(game_board.all? { |arr| arr.length == 8 }).to be true
    end

    it "second dimensional arrays should be filled with hashes" do
      board = Board.new
      game_board = board.create_board
      expect(game_board.flatten.all? { |v| v.is_a?(Hash) }).to be true
    end
  end
end