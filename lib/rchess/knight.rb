require "rchess/movement"

module Rchess
  class Knight
    include Rchess::Movement
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
      el_shaped_move?(start_pos, end_pos)
    end
  end
end
