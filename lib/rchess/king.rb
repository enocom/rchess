module Rchess
  class King
    include Rchess::BoardMath

    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :king
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "K" : "k"
    end

    def can_move_to_position?(start_pos, end_pos)
      one_square_move?(start_pos, end_pos)
    end

    private
    def one_square_move?(start_pos, end_pos)
      start_file, end_file = start_pos[0], end_pos[0]
      start_rank, end_rank = start_pos[1], end_pos[1]

      (letter_difference(start_file, end_file).abs == 1 &&
       rank_difference(start_rank, end_rank).abs == 0) ||
      (rank_difference(start_rank, end_rank).abs == 1 &&
       letter_difference(start_file, end_file).abs == 0) ||
      (letter_difference(start_file, end_file).abs == 1 &&
       rank_difference(start_rank, end_rank).abs == 1)
    end
  end
end
