#lib/symbols.rb

module Symbols
  SYMBOLS = {
    w_board: "\u{25A0}",
    w_king: "\u{265A}",
    w_queen: "\u{265B}",
    w_rook: "\u{265C}",
    w_bishop: "\u{265D}",
    w_knight: "\u{265E}",
    w_pawn: "\u{265F}",
    b_board: "\u{25A1}",
    b_king: "\u{2654}",
    b_queen: "\u{2655}",
    b_rook: "\u{2656}",
    b_bishop: "\u{2657}",
    b_knight: "\u{2658}",
    b_pawn: "\u{2659}"
  }

  def get_symbol(key)
    SYMBOLS[key.to_sym]
  end

end