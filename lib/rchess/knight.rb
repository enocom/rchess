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
      up_up_left?(start_pos, end_pos) ||
        up_up_right?(start_pos, end_pos) ||
        up_left_left?(start_pos, end_pos) ||
        up_right_right?(start_pos, end_pos) ||
        down_left_left?(start_pos, end_pos) ||
        down_right_right?(start_pos, end_pos) ||
        down_down_left?(start_pos, end_pos) ||
        down_down_right?(start_pos, end_pos)
    end

    private
    def rotate_letter(letter, direction, offset)
      letters = %w(a b c d e f g h)
      index_of_current_letter = letters.index(letter)
      rotated_index = if direction == :right
                        index_of_current_letter + offset
                      else
                        index_of_current_letter - offset
                      end

      if rotated_index > 7
        rotated_index = rotated_index - 8
      elsif rotated_index < 0
        rotated_index = 8 + rotated_index
      end

      letters[rotated_index]
    end

    def up_up_left?(start_pos, end_pos)
      (start_pos[0].to_i + 2) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :left, 1) == end_pos[1]
    end

    def up_up_right?(start_pos, end_pos)
      (start_pos[0].to_i + 2) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :right, 1) == end_pos[1]
    end

    def up_left_left?(start_pos, end_pos)
      (start_pos[0].to_i + 1) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :left, 2) == end_pos[1]
    end

    def up_right_right?(start_pos, end_pos)
      (start_pos[0].to_i + 1) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :right, 2) == end_pos[1]
    end

    def down_left_left?(start_pos, end_pos)
      (start_pos[0].to_i - 1) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :left, 2) == end_pos[1]
    end

    def down_right_right?(start_pos, end_pos)
      (start_pos[0].to_i - 1) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :right, 2) == end_pos[1]
    end

    def down_down_left?(start_pos, end_pos)
      (start_pos[0].to_i - 2) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :left, 1) == end_pos[1]
    end

    def down_down_right?(start_pos, end_pos)
      (start_pos[0].to_i - 2) == end_pos[0].to_i &&
        rotate_letter(start_pos[1], :right, 1) == end_pos[1]
    end
  end
end
