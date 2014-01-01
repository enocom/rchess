module Rchess
  class Knight
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
        rank_with_offset_matches?(start_pos, end_pos, dy) &&
          file_with_offset_matches?(start_pos, end_pos, dx)
      end.include? true
    end

    private
    def rotate_letter(letter, offset)
      letters = %w(a b c d e f g h)
      index_of_current_letter = letters.index(letter)
      rotated_index = index_of_current_letter + offset

      if rotated_index > 7
        rotated_index = rotated_index - 8
      elsif rotated_index < 0
        rotated_index = 8 + rotated_index
      end

      letters[rotated_index]
    end

    def rank_with_offset_matches?(start_pos, end_pos, rank_offset)
      (start_pos[0].to_i + rank_offset) == end_pos[0].to_i
    end

    def file_with_offset_matches?(start_pos, end_pos, file_offset)
      rotate_letter(start_pos[1], file_offset) == end_pos[1]
    end
  end
end
