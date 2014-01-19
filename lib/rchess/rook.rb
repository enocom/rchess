require "rchess/movement"

module Rchess
  class Rook
    include Rchess::Movement
    include Rchess::BoardMath

    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :rook
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "R" : "r"
    end

    def can_move_to_position?(start_pos, end_pos)
      straight_move?(start_pos, end_pos)
    end

    def intermediate_positions(start_pos, end_pos)
      find_intermediate_between(start_pos, end_pos, :horizontal)
    end
  end
end
