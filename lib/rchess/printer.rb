module Rchess
  class Printer
    SEPARATOR = "   + - + - + - + - + - + - + - + - +".freeze
    RANKS = %w(8 7 6 5 4 3 2 1).freeze

    def initialize(out=$stdout)
      @out = out
    end

    def print_board(board)
      clear_screen
      @out.print transform_to_grid(board)
    end

    def prompt_user
      @out.print newline + "Enter a move: "
    end

    def bad_input_message
      @out.print newline + "Invalid input. Please try again." + newline
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
        "#{rank}  | " + row_from_rank(board, rank) + " |" + newline
      }.join(SEPARATOR + newline)

      grid_bottom = SEPARATOR + newline +
      "     " + ["a", "b", "c", "d", "e", "f", "g", "h"].join("   ") + newline

      grid_top + grid_body + grid_bottom
    end

    def row_from_rank(board, rank)
      ("a".."h").map { |file| file + rank }.map do |pos|
        board[pos]
      end.join(" | ")
    end
  end
end
