require "spec_helper"

describe Rchess::Queen do
  it "returns its single letter name" do
    lowercase = Rchess::Queen.new(:lowercase)
    uppercase = Rchess::Queen.new(:uppercase)

    expect(lowercase.letter).to eq "q"
    expect(uppercase.letter).to eq "Q"
  end

  describe "moving on the board" do
    let(:starting_pos) { "d5" }
    let(:queen) { Rchess::Queen.new(:uppercase) }

    it "recognizes illegal moves" do
      illegal_move = "b6"
      expect(
        queen.can_move_to_position?(starting_pos, illegal_move)
      ).to eq false
    end

    describe "moving diagonally" do
      it "moves single or multiple squares at a time" do
        single_square = "e6"
        expect(
          queen.can_move_to_position?(starting_pos, single_square)
        ).to eq true

        multiple_squares = "f7"
        expect(
          queen.can_move_to_position?(starting_pos, multiple_squares)
        ).to eq true
      end

      it "moves to the upper-right" do
        ending_position = "g8"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves to the lower-right" do
        ending_position = "g2"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves to the upper-left" do
        ending_position = "b7"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves to the lower-left" do
        ending_position = "a2"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end
    end

    describe "moving vertically and horizontally" do
      it "moves single or multiple squares at a time" do
        single_square = "c5"
        expect(
          queen.can_move_to_position?(starting_pos, single_square)
        ).to eq true

        multiple_squares = "g5"
        expect(
          queen.can_move_to_position?(starting_pos, multiple_squares)
        ).to eq true
      end

      it "moves up" do
        ending_position = "d7"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves down" do
        ending_position = "d3"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves left" do
        ending_position = "a5"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end

      it "moves right" do
        ending_position = "h5"
        expect(
          queen.can_move_to_position?(starting_pos, ending_position)
        ).to eq true
      end
    end
  end
end
