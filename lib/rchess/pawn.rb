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
      if option == :no_capture
        return one_square_forward?(start_pos, end_pos)
      end

      one_diagonal_forward?(start_pos, end_pos)
    end

    private
    def one_square_forward?(start_pos, end_pos)
      rank_difference(start_pos[1], end_pos[1]) == 1 &&
        letter_difference(start_pos[0], end_pos[0]) == 0
    end

    def one_diagonal_forward?(start_pos, end_pos)
      rank_difference(start_pos[1], end_pos[1]) == 1 &&
        letter_difference(start_pos[0], end_pos[0]).abs == 1
    end
  end
end
