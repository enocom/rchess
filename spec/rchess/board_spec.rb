require "spec_helper"

describe Rchess::Board do
  include ChessGameStrings
  PIECE_NAMES = [
    :rook, :knight, :bishop, :king,
    :queen, :bishop, :knight, :rook
  ]

  let(:board) { Rchess::Board.new }

  describe "initialization" do
    it "accepts an optional CSV string of past moves" do
      prepopulated_board = Rchess::Board.new(ambiguous_knights_csv)

      expect(prepopulated_board["f6"].name).to eq :knight
      expect(prepopulated_board["f6"].lettercase).to eq :uppercase
      expect(prepopulated_board["d4"].name).to eq :pawn
      expect(prepopulated_board["d4"].lettercase).to eq :lowercase
    end

    it "allows access to its 64 squares with chess notation" do
      expect(board["a8"].name).to eq :rook
      expect(board["d1"].name).to eq :king
    end

    it "distinguishes sides by case" do
      expect(board["d8"].lettercase).to eq :uppercase
      expect(board["d1"].lettercase).to eq :lowercase
    end

    it "has empty squares" do
      expect(board["d4"].name).to eq :empty
    end

    it "places all the pieces in their correct positions" do
      expect_pieces_are_placed_correctly_for_rank("8", :uppercase)
      expect_pawns_are_placed_correctly_for_rank("7", :uppercase)

      expect_pawns_are_placed_correctly_for_rank("2", :lowercase)
      expect_pieces_are_placed_correctly_for_rank("1", :lowercase)
    end

    def expect_pieces_are_placed_correctly_for_rank(rank, lettercase)
      ("a".."h").map { |file| file + rank }
        .zip(PIECE_NAMES).each do |pos, piece|
          expect(board[pos].name).to eq piece
          expect(board[pos].lettercase).to eq lettercase
        end
    end

    def expect_pawns_are_placed_correctly_for_rank(rank, lettercase)
      ("a".."h").map { |file| file + rank }.each do |pos|
        expect(board[pos].name).to eq :pawn
        expect(board[pos].lettercase).to eq lettercase
      end
    end
  end

  describe "parsing moves" do
    it "handles piece names and destinations" do
      expect(board.parse("ne2")).to eq ["n", :no_origin, "e2"]
    end

    it "handles piece names, origins, and destinations" do
      expect(board.parse("nge2")).to eq ["n", "g", "e2"]
    end
  end

  describe "moving pieces" do
    it "finds the position of a piece" do
      piece1 = board["a1"]
      piece2 = board["d2"]

      expect(board.find_file_and_rank(piece1)).to eq "a1"
      expect(board.find_file_and_rank(piece2)).to eq "d2"
    end

    it "moves pieces across the board" do
      board.commit_move("nc3")
      expect(board["b1"].name).to eq :empty
      expect(board["c3"].name).to eq :knight
    end

    xit "prevents a piece from moving if it is blocked by another piece" do
      expect(board.commit_move("ra3")).to eq :illegal_move
      expect(board["a3"].name).to eq :empty
      expect(board["a1"].name).to eq :rook
    end

    it "allows pieces to capture other pieces" do
      before_capture = Rchess::Board.new(before_capture_csv)
      expect(before_capture["h6"].lettercase).to eq :lowercase

      board.commit_move("Bh6")
      expect(board["h6"].lettercase).to eq :uppercase
    end

    describe "return values of a move" do
      it "returns :success if the move succeeded" do
        expect(board.commit_move "nc3" ).to eq :success
      end

      it "returns :illegal_move if no pieces were identified to be moved" do
        expect(board.commit_move "nd5" ).to eq :illegal_move
      end

      it "returns :ambiguous_move if more than one piece was identified" do
        ambiguous_board = Rchess::Board.new ambiguous_knights_csv
        expect(ambiguous_board.commit_move ambiguous_move ).to eq :ambiguous_move
      end
    end

    it "accepts an originating file in a move" do
      board = Rchess::Board.new(ambiguous_knights_csv)
      expect(board.commit_move(unambiguous_knight_move)).to eq :success
      expect(board["e2"].name).to eq :knight
    end

    it "finds an implied piece by its move" do
      board.commit_move("Pe6")
      expect(board["e7"].name).to eq :empty
      expect(board["e6"].name).to eq :pawn
      expect(board["e6"].lettercase).to eq :uppercase
    end
  end
end
