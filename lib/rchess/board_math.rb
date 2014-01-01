module Rchess
  module BoardMath
    LETTERS = %w(a b c d e f g h)

    def rotate_letter(letter, offset)
      index_of_current_letter = LETTERS.index(letter)
      rotated_index = index_of_current_letter + offset

      if rotated_index > 7
        rotated_index = rotated_index - 8
      elsif rotated_index < 0
        rotated_index = 8 + rotated_index
      end

      LETTERS[rotated_index]
    end

    def letter_difference(start_file, end_file)
      start_index = LETTERS.index(start_file)
      end_index = LETTERS.index(end_file)

      end_index - start_index
    end

    def rank_difference(start_rank, end_rank)
      end_rank.to_i - start_rank.to_i
    end
  end
end
