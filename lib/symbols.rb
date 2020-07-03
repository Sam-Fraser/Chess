#lib/symbols.rb

module Symbols
  SYMBOLS = {
    w_board: "\u{25A0}",
    w_king: "\u{2654}",
    w_queen: "\u{2655}",
    w_rook: "\u{2656}",
    w_bishop: "\u{2657}",
    w_knight: "\u{2658}",
    w_pawn: "\u{2659}",
    b_board: "\u{25A1}",
    b_king: "\u{265A}",
    b_queen: "\u{265B}",
    b_rook: "\u{265C}",
    b_bishop: "\u{265D}",
    b_knight: "\u{265E}",
    b_pawn: "\u{265F}"
  }

  def get_symbol(key)
    SYMBOLS[key.to_sym]
  end

end