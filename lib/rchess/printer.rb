module Rchess
  class Printer
    SEPARATOR = "   + - + - + - + - + - + - + - + - +".freeze
    RANKS = [8, 7, 6, 5, 4, 3, 2, 1].freeze
    RANK_TO_FILES = {
      8 => (0..7),   7 => (8..15),  6 => (16..23), 5 => (24..31),
      4 => (32..39), 3 => (40..47), 2 => (48..55), 1 => (56..63)
    }.freeze

    def initialize(out=$stdout)
      @out = out
    end

    def print_board(board)
      clear_screen
      @out.print transform_to_grid(board)
    end

    private

    def clear_screen
      @out.print "\e[H\e[2J"
    end

    def newline
      "\n"
    end

    def transform_to_grid(board)
      grid_top = SEPARATOR + newline

      grid_body = RANKS.map { |rank|
        "#{rank}  | " + board_rank(board, rank) + " |" + newline
      }.join(SEPARATOR + newline)

      grid_bottom = SEPARATOR + newline +
      "     " + ["a", "b", "c", "d", "e", "f", "g", "h"].join("   ") + newline

      grid_top + grid_body + grid_bottom
    end

    def board_rank(board, rank_num)
      board[RANK_TO_FILES[rank_num]].join(" | ")
    end
  end
end
