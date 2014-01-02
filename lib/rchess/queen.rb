module Rchess
  class Queen
    include Rchess::Movement
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
  end
end
