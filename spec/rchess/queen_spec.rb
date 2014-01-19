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

      [
        ["upper-right", "g8"],
        ["lower-right", "g2"],
        ["upper-left",  "b7"],
        ["lower-left",  "a2"]
      ].each do |direction, ending_position|
        it "moves to the #{direction}" do
          expect(
            queen.can_move_to_position?(starting_pos, ending_position)
          ).to eq true
        end
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

      [
        ["up", "d7"],
        ["down", "d3"],
        ["left", "a5"],
        ["right", "h5"]
      ].each do |direction, ending_position|
        it "moves #{direction}" do
          expect(
            queen.can_move_to_position?(starting_pos, ending_position)
          ).to eq true
        end
      end
    end
  end
end
