module Rchess
  class Bishop
    include Rchess::Movement
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :bishop
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "B" : "b"
    end

    def can_move_to_position?(start_pos, end_pos)
      diagonal_move?(start_pos, end_pos)
    end

    def intermediate_positions(start_pos, end_pos)
      find_intermediate_between(start_pos, end_pos)
    end
  end
end
