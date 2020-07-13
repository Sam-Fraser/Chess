#lib/game.rb
require_relative "player.rb"

#game class
class Game
  attr_reader :board, :current_player, :opponent

  def initialize
    @board = Board.new
    @player2 = Player.new("black", @board, "player1")
    @board.flip_board
    @player2.flip_pieces
    @player1 = Player.new("white", @board, @player2)
    @player2.opponent = @player1
    @current_player = @player1
    @opponent = @player2
  end

  #switch turns method
  def switch_turns
    @board.flip_board
    @current_player.flip_pieces
    @opponent.flip_pieces
    if @current_player == @player1
      @current_player = @player2
      @opponent = @player1
    else
      @current_player = @player1
      @opponent = @player2
    end
  end
end