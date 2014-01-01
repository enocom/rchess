module Rchess
  class Rook
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
      start_file, start_rank = start_pos[0], start_pos[1]
      end_file, end_rank = end_pos[0], end_pos[1]

      start_rank == end_rank || start_file == end_file
    end
  end
end
