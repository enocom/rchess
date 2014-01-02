require "rchess/movement"

module Rchess
  class Rook
    include Rchess::Movement

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
  end
end
