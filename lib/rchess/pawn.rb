module Rchess
  class Pawn
    include Rchess::BoardMath
    UPPERCASE_TWO_FORWARD = ("a".."h").map { |letter| letter + "5" }
    LOWERCASE_TWO_FORWARD = ("a".."h").map { |letter| letter + "4" }

    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @lettercase = lettercase
      @name = :pawn
    end

    def to_s
      letter
    end

    def letter
      uppercase? ? "P" : "p"
    end

    def uppercase?
      @lettercase == :uppercase
    end

    def can_move_to_position?(start_pos, end_pos, option=:no_capture)
      return valid_capture_move?(start_pos, end_pos) if option == :capture
      return true if valid_opening_move?(start_pos, end_pos)

      # uppercase pawns move down
      return one_square?(:down, start_pos, end_pos) if uppercase?

      # lowercase pawns move up
      one_square?(:up, start_pos, end_pos)
    end

    def intermediate_positions(start_pos, end_pos)
      find_intermediate_between(start_pos, end_pos, :straight)
    end

    private
    def valid_opening_move?(start_pos, end_pos)
      if uppercase?
        return UPPERCASE_TWO_FORWARD.include?(end_pos) &&
          letter_difference(start_pos[0], end_pos[0]) == 0 &&
          rank_difference(start_pos[1], end_pos[1]) == -2
      end

      LOWERCASE_TWO_FORWARD.include?(end_pos) &&
        letter_difference(start_pos[0], end_pos[0]) == 0 &&
        rank_difference(start_pos[1], end_pos[1]) == 2
    end

    def one_square?(direction_y, start_pos, end_pos, direction_x=:straight)
      dy = direction_y == :up ? 1 : -1
      dx = direction_x == :straight ? 0 : 1

      rank_difference(start_pos[1], end_pos[1]) == dy &&
        letter_difference(start_pos[0], end_pos[0]).abs == dx
    end

    def valid_capture_move?(start_pos, end_pos)
      return one_square?(:down, start_pos, end_pos, :diagonal) if uppercase?

      one_square?(:up, start_pos, end_pos, :diagonal)
    end
  end
end
