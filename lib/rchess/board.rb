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

    def initialize(board_csv="")
      if board_csv.empty?
        initialize_default_board
      else
        initialize_with_csv(board_csv)
      end
    end

    def [](position)
      file, rank = position[0], position[1]

      @storage[index_from_file_and_rank(file, rank)]
    end

    def commit_move(move)
      piece_letter, origin, new_position = parse(move)
      pieces_to_move = find_implied_pieces(piece_letter, origin, new_position)
      return :illegal_move if pieces_to_move.empty?
      return :ambiguous_move if pieces_to_move.count > 1

      move_piece(pieces_to_move.first, new_position)
    end

    def find_file_and_rank(piece)
      index_of_piece = @storage.index(piece)
      y = index_of_piece / 8
      x = index_of_piece % 8
      X_TO_FILE[x] + Y_TO_RANK[y]
    end

    def parse(move)
      if move.length > 3
        return [move[0], move[1], move[2..3]]
      end

      [move[0], :no_origin, move[1..2]]
    end

    private

    def initialize_default_board
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

    def initialize_with_csv(board_csv)
      initialize_default_board
      board_csv.split(",").each do |move|
        commit_move move
      end
    end

    def move_piece(piece, new_position)
      old = @storage.index(piece)
      new = index_from_file_and_rank(new_position[0], new_position[1])

      # if it's a capture
      if @storage[new].name != :empty
        @storage[new] = @storage[old]
        @storage[old] = Rchess::EmptySquare.new
      else
        @storage[old], @storage[new] = @storage[new], @storage[old]
      end

      :success
    end

    def index_from_file_and_rank(file, rank)
      FILE_TO_X[file] + (RANK_TO_Y[rank] * BOARD_SIDE)
    end

    def find_implied_pieces(piece_letter, origin, new_position)
      # get all the pieces matching the letter
      pieces = @storage.select { |piece| piece.letter == piece_letter }

      # get all the pieces that can move to a position
      implied_pieces = pieces.select do |piece|
        old_position = find_file_and_rank(piece)
        piece.can_move_to_position?(old_position, new_position)
      end

      # select the piece which have the specified origin
      if origin != :no_origin
        implied_pieces = pieces.select do |piece|
          old_file = find_file_and_rank(piece)[0]
          old_file == origin
        end
      end

      implied_pieces
    end
  end
end
