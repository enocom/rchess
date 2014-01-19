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

    def intermediate_positions(start_pos, end_pos)
      []
    end

    private
    def one_square_move?(start_pos, end_pos)
      start_file, end_file = start_pos[0], end_pos[0]
      start_rank, end_rank = start_pos[1], end_pos[1]

      [
        [1, 0], [0, 1], [1, 1]
      ].map do |dx, dy|
        (letter_difference(start_file, end_file).abs == dx) &&
          (rank_difference(start_rank, end_rank).abs == dy)
      end.include? true
    end
  end
end
