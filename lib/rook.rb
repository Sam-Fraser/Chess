#lib/rook.rb
require_relative "piece.rb"

#rook class (subclass of piece)
class Rook < Piece
  #set_moves method
  def all_moves
    final_array = []
    7.times do |i|
      array1 = [0,i+1]
      array2 = [0,-i-1]
      final_array.push(array1, array1.reverse, array2, array2.reverse)
    end
    final_array
  end
end