module Rchess
  class Pawn
    include Rchess::BoardMath

    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @lettercase = lettercase
      @name = :pawn
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "P" : "p"
    end

    def can_move_to_position?(start_pos, end_pos, option=:no_capture)
      return valid_capture_move?(start_pos, end_pos) if option == :capture

      # uppercase pawns move down
      if lettercase == :uppercase
        return one_square?(:down, start_pos, end_pos)
      end

      # lowercase pawns move up
      one_square?(:up, start_pos, end_pos)
    end

    private
    def one_square?(direction_y, start_pos, end_pos, direction_x=:straight)
      dy = direction_y == :up ? 1 : -1
      dx = direction_x == :straight ? 0 : 1

      rank_difference(start_pos[1], end_pos[1]) == dy &&
        letter_difference(start_pos[0], end_pos[0]).abs == dx
    end

    def valid_capture_move?(start_pos, end_pos)
      if lettercase == :uppercase
        return one_square?(:down, start_pos, end_pos, :diagonal)
      end

      one_square?(:up, start_pos, end_pos, :diagonal)
    end
  end
end
