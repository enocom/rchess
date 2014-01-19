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

        rank_memo = intermediate_ranks(start_rank, rank_difference)
        return rank_memo.map { |rank| start_file + rank.to_s }
      end

      # it's horizontal
      difference = letter_difference(start_file, end_file)
      file_difference = difference > 0 ? difference - 1 : difference + 1
      file_memo = intermediate_files(start_file, file_difference)
      file_memo.map { |file| file + start_rank }
    end

    def find_diagonal_positions(start_pos, end_pos)
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      difference = letter_difference(start_file, end_file)
      file_difference = difference > 0 ? difference - 1 : difference + 1

      file_memo = intermediate_files(start_file, file_difference)
      rank_difference = rank_difference(start_rank, end_rank) - 1
      rank_memo = intermediate_ranks(start_rank, rank_difference)
      file_memo.zip(rank_memo).flatten.each_slice(2).map { |el| el.join("") }
    end

    def intermediate_ranks(start_rank, rank_difference)
      intermediate_squares(start_rank.to_i, rank_difference) do |rank, diff|
        rank + (rank_difference > 0 ? 1 : -1)
      end
    end

    def intermediate_files(start_file, file_difference)
      intermediate_squares(start_file, file_difference) do |file, diff|
        rotate_letter(file, file_difference > 0 ? 1 : -1)
      end
    end

    def intermediate_squares(rank, difference, &lookup_next)
      difference.abs.times.map do
        rank = lookup_next.call(rank, difference)
      end
    end
  end
end
