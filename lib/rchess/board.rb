require "rchess/rook"
require "rchess/knight"
require "rchess/bishop"
require "rchess/king"
require "rchess/queen"
require "rchess/pawn"
require "rchess/empty_square"

module Rchess
  PIECES = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

  class Board
    RANK_TO_Y = {
      "8" => 0, "7" => 1, "6" => 2, "5" => 3,
      "4" => 4, "3" => 5, "2" => 6, "1" => 7
    }
    FILE_TO_X = Hash[("a".."h").zip(0..7)]
    BOARD_SIDE = 8
    Y_TO_RANK = {
      0 => "8", 1 => "7", 2 => "6", 3 => "5",
      4 => "4", 5 => "3", 6 => "2", 7 => "1"
    }
    X_TO_FILE = Hash[(0..7).zip("a".."h")]

    def initialize
      uppercase_pieces = PIECES.map { |piece| piece.new(:uppercase) }
      uppercase_pawns  = (1..8).map { Rchess::Pawn.new(:uppercase) }

      empty_row_1 = (1..8).map { Rchess::EmptySquare.new }
      empty_row_2 = (1..8).map { Rchess::EmptySquare.new }
      empty_row_3 = (1..8).map { Rchess::EmptySquare.new }
      empty_row_4 = (1..8).map { Rchess::EmptySquare.new }

      lowercase_pieces = PIECES.map { |piece| piece.new(:lowercase) }
      lowercase_pawns  = (1..8).map { Rchess::Pawn.new(:lowercase) }

      @storage = [
        uppercase_pieces, uppercase_pawns,
        empty_row_1, empty_row_2, empty_row_3, empty_row_4,
        lowercase_pawns, lowercase_pieces
      ].flatten
    end

    def [](position)
      file, rank = position[0], position[1]

      @storage[index_from_file_and_rank(file, rank)]
    end

    def find_file_and_rank(piece)
      index_of_piece = @storage.index(piece)
      y = index_of_piece / 8
      x = index_of_piece % 8
      X_TO_FILE[x] + Y_TO_RANK[y]
    end

    private
    def index_from_file_and_rank(file, rank)
      FILE_TO_X[file] + (RANK_TO_Y[rank] * BOARD_SIDE)
    end
  end
end
