#lib/piece.rb
require_relative "symbols.rb"

#parent class for all pieces
class Piece
  include(Symbols)
  attr_reader :name, :current_position, :first_move

  #initialize with current_position, name, first_move boolean
  def initialize(starting_position, name)
    @current_position = starting_position
    @name = get_symbol(name)
    @first_move = true
  end

  #general move piece method
  def move(movement)
    @first_move = false
    @current_position = [@current_position[0] + movement[0], @current_position[1] + movement[1]]
  end
end