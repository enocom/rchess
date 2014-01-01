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
  end
end
