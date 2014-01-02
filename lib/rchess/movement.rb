require "rchess/board_math"

module Rchess
  module Movement
    include Rchess::BoardMath

    def diagonal_move?(start_pos, end_pos)
      file_difference = letter_difference(start_pos[0], end_pos[0])
      rank_difference = rank_difference(start_pos[1], end_pos[1])

      file_difference.abs == rank_difference.abs
    end

    def straight_move?(start_pos, end_pos)
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      start_rank == end_rank || start_file == end_file
    end
  end
end
