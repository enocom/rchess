require "spec_helper"

describe Rchess::Board do
  include ChessGameStrings
  PIECE_NAMES = [
    :rook, :knight, :bishop, :king,
    :queen, :bishop, :knight, :rook
  ]

  let(:board) { Rchess::Board.new }

  describe "initialization" do
    it "allows access to its 64 squares with chess notation" do
      expect(board["8a"].name).to eq :rook
      expect(board["1d"].name).to eq :king
    end

    it "distinguishes sides by case" do
      expect(board["8d"].lettercase).to eq :uppercase
      expect(board["1d"].lettercase).to eq :lowercase
    end

    it "has empty squares" do
      expect(board["4d"].name).to eq :empty
    end

    it "places all the pieces in their correct positions" do
      expect_pieces_are_placed_correctly_for_rank("8", :uppercase)
      expect_pawns_are_placed_correctly_for_rank("7", :uppercase)

      expect_pawns_are_placed_correctly_for_rank("2", :lowercase)
      expect_pieces_are_placed_correctly_for_rank("1", :lowercase)
    end

    def expect_pieces_are_placed_correctly_for_rank(rank, lettercase)
      ("a".."h").map { |file| rank + file }
        .zip(PIECE_NAMES).each do |pos, piece|
          expect(board[pos].name).to eq piece
          expect(board[pos].lettercase).to eq lettercase
        end
    end

    def expect_pawns_are_placed_correctly_for_rank(rank, lettercase)
      ("a".."h").map { |file| rank + file }.each do |pos|
        expect(board[pos].name).to eq :pawn
        expect(board[pos].lettercase).to eq lettercase
      end
    end
  end
end
