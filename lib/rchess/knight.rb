require "rchess/board_math"

module Rchess
  class Knight
    include Rchess::BoardMath
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :knight
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "N" : "n"
    end

    def can_move_to_position?(start_pos, end_pos)
      [
        [2, -1], [2, 1], [1, -2], [1, 2],
        [-1, -2], [-1, 2], [-2, -1], [-2, 1]
      ].map do |dy, dx|
        file_with_offset_matches?(start_pos, end_pos, dx) &&
          rank_with_offset_matches?(start_pos, end_pos, dy)
      end.include? true
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
