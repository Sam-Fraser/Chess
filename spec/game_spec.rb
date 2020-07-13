#spec/game_spec.rb
require "./lib/game.rb"

describe Game do
  before(:each) do
    @new_game = Game.new
  end

  describe "#switch_turns" do
    it "will flip the gameboard" do
      BOARD_OUTPUT = <<~OUTPUT
      a b c d e f g h 
    1 \u{265C} \u{265E} \u{265D} \u{265A} \u{265B} \u{265D} \u{265E} \u{265C} 
    2 \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} 
    3 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    4 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    5 \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} 
    6 \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} \u{25A1} \u{25A0} 
    7 \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} 
    8 \u{2656} \u{2658} \u{2657} \u{2654} \u{2655} \u{2657} \u{2658} \u{2656} 
      OUTPUT
      
      @new_game.switch_turns
      expect{ puts @new_game.board.display_board }.to output(BOARD_OUTPUT).to_stdout
    end

    it "will switch the current player" do
      opponent = @new_game.opponent
      @new_game.switch_turns
      expect(@new_game.current_player).to eql(opponent)
    end

    it "will switch the opponent player" do
      current_player = @new_game.current_player
      @new_game.switch_turns
      expect(@new_game.opponent).to eql(current_player)
    end
  end
end