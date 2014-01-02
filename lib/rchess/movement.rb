require "rchess/board_math"

module Rchess
  module Movement
    include Rchess::BoardMath

    def diagonal_move?(start_pos, end_pos)
      file_difference = letter_difference(start_pos[0], end_pos[0])
      rank_difference = rank_difference(start_pos[1], end_pos[1])

      file_difference.abs == rank_difference.abs
    end

    def el_shaped_move?(start_pos, end_pos)
      [
        [2, -1], [2, 1], [1, -2], [1, 2],
        [-1, -2], [-1, 2], [-2, -1], [-2, 1]
      ].map do |dy, dx|
        file_with_offset_matches?(start_pos, end_pos, dx) &&
          rank_with_offset_matches?(start_pos, end_pos, dy)
      end.include? true
    end

    def straight_move?(start_pos, end_pos)
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      start_rank == end_rank || start_file == end_file
    end

    private
    def rank_with_offset_matches?(start_pos, end_pos, rank_offset)
      (start_pos[1].to_i + rank_offset) == end_pos[1].to_i
    end

    def file_with_offset_matches?(start_pos, end_pos, file_offset)
      rotate_letter(start_pos[0], file_offset) == end_pos[0]
    end
  end
end
