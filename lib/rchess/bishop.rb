module Rchess
  class Bishop
    include Rchess::BoardMath
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
      file_difference = letter_difference(start_pos[0], end_pos[0])
      rank_difference = rank_difference(start_pos[1], end_pos[1])

      file_difference.abs == rank_difference.abs
    end
  end
end
