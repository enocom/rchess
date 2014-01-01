module Rchess
  module LetterMath
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
  end
end
