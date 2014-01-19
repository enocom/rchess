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
      LETTERS.index(end_file) - LETTERS.index(start_file)
    end

    def rank_difference(start_rank, end_rank)
      end_rank.to_i - start_rank.to_i
    end

    def find_intermediate_between(start_pos, end_pos, type=:diagonal)
      case type
      when :diagonal
        find_diagonal_positions(start_pos, end_pos)
      else
        find_straight_positions(start_pos, end_pos)
      end
    end

    private

    def find_straight_positions(start_pos, end_pos)
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      if start_file == end_file # it's vertical
        rank_difference = rank_difference(start_rank, end_rank)
        if rank_difference < 0
          rank_difference += 1
        else
          rank_difference -= 1
        end

        rank_memo = []
        rank = start_rank.to_i
        rank_difference.abs.times do
          result = rank + (rank_difference > 0 ? 1 : -1)
          rank_memo << result
          rank = result
        end

        return rank_memo.map { |rank| start_file + rank.to_s }
      end

      # it's horizontal
      difference = letter_difference(start_file, end_file)
      file_difference = difference > 0 ? difference - 1 : difference + 1

      file_memo = []
      letter = start_file
      file_difference.abs.times do
        rotation_direction = file_difference > 0 ? 1 : -1
        result = rotate_letter(letter, rotation_direction)
        file_memo << result
        letter = result
      end

      file_memo.map { |file| file + start_rank }
    end

    def find_diagonal_positions(start_pos, end_pos)
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      difference = letter_difference(start_file, end_file)
      file_difference = difference > 0 ? difference - 1 : difference + 1

      file_memo = []
      letter = start_file
      file_difference.abs.times do
        rotation_direction = file_difference > 0 ? 1 : -1
        result = rotate_letter(letter, rotation_direction)
        file_memo << result
        letter = result
      end

      rank_difference = rank_difference(start_rank, end_rank) - 1

      rank_memo = []
      rank = start_rank.to_i
      rank_difference.abs.times do
        result = rank + (rank_difference > 0 ? 1 : -1)
        rank_memo << result
        rank = result
      end

      file_memo.zip(rank_memo).flatten.each_slice(2).map { |el| el.join("") }
    end
  end
end
