module Rchess
  class Queen
    include Rchess::Movement
    include Rchess::BoardMath

    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :queen
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "Q" : "q"
    end

    def can_move_to_position?(start_pos, end_pos)
      diagonal_move?(start_pos, end_pos) ||
        straight_move?(start_pos, end_pos)
    end

    def intermediate_positions(start_pos, end_pos)
      if straight_move?(start_pos, end_pos)
        find_intermediate_between(start_pos, end_pos, :horizontal)
      else
        find_intermediate_between(start_pos, end_pos, :diagonal)
      end
    end
  end
end
