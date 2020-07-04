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

  describe "#place_piece" do
    before(:each) do
      @board = Board.new
    end

    it "will place a piece on a specific space given an array" do
      @board.place_piece([4,1], "\u{2658}")
      expect(@board.board[4][1][:piece]).to eql "\u{2658}"
    end
  end

  describe "#remove_piece" do
    before(:each) do
      @board = Board.new
    end

    it "will place a piece on a specific space given an array" do
      @board.place_piece([4,1], "\u{2658}")
      @board.remove_piece([4,1])
      expect(@board.board[4][1][:piece]).to be nil
    end
  end

  describe "#valid_move?" do
    before(:each) do
      @board = Board.new
    end

    it "will return true if space to move is within bounds of board" do
      expect(@board.valid_move?([4,3])).to be true
    end

    it "will return false if space to move is out of bounds of board" do
      expect(@board.valid_move?([8,4])).to be false
    end

    it "will return false if space to move is occupied by another piece" do
      @board.board[0][5][:piece] = @board.get_symbol("w_knight")
      expect(@board.valid_move?([0,5])).to be false
    end
  end

  describe "#display_board" do
    before(:each) do
      @board = Board.new
    end

    it "will return a blank board without pieces" do
    DISPLAY = <<-DISPLAY
  a b c d e f g h 
1 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
2 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
3 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
4 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
5 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
6 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
7 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
8 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
      DISPLAY
      puts @board.display_board 
      expect{ puts @board.display_board }.to output(DISPLAY).to_stdout
    end

    it "will return a board with pieces in the right place" do
      DISPLAY2 = <<~DISPLAY
      a b c d e f g h 
    1 \u{2654} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    2 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    3 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    4 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    5 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    6 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    7 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    8 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
          DISPLAY
          @board.board[0][0][:piece] = "\u{2654}"
          expect{ puts @board.display_board }.to output(DISPLAY2).to_stdout
    end
  end
end