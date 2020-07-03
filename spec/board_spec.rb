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

  describe "#set_base_vals" do
    before(:each) do
      board = Board.new
      @game_board = board.create_board
      board.set_base_vals(@game_board)
    end

    it "will make the first spots base piece white" do
      expect(@game_board[0][0][:base]).to eql "\u{25A0}"
    end

    it "will make the second rows first spots base piece black" do
      expect(@game_board[1][0][:base]).to eql "\u{25A1}"
    end
  end
end