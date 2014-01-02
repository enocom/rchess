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

    def can_move_to_position?(start_pos, end_pos)
      one_square_forward?(start_pos, end_pos)
    end

    private
    def one_square_forward?(start_pos, end_pos)
      rank_difference(start_pos[1], end_pos[1]) == 1 &&
        letter_difference(start_pos[0], end_pos[0]) == 0
    end
  end
end
