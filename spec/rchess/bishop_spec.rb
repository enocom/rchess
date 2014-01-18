require "spec_helper"

describe Rchess::Bishop do
  it "returns its single letter name" do
    lowercase = Rchess::Bishop.new(:lowercase)
    uppercase = Rchess::Bishop.new(:uppercase)

    expect(lowercase.letter).to eq "b"
    expect(uppercase.letter).to eq "B"
  end

  describe "movement on the board" do
    let(:bishop) { Rchess::Bishop.new(:uppercase) }
    let(:starting_point) { "d5" }

    context "identifying intermediate positions" do
        [
          ["g8", ["e6", "f7"], "upper right"],
          ["a8", ["c6", "b7"], "upper left"],
          ["g2", ["e4", "f3"], "lower right"],
          ["a2", ["c4", "b3"], "lower left"]
        ].each do |end_position, intermediate_squares, direction|
        it "returns a list of positions when moving to the #{direction}" do
          expect(
            bishop.intermediate_positions(starting_point, end_position)
          ).to eq intermediate_squares
        end
      end
    end

    context "legal moves" do
      [
        ["f7", "upper right"],
        ["b7", "upper left"],
        ["g2", "lower right"],
        ["b3", "lower left"]
      ].each do |end_position, direction|
        it "can move to the #{direction}" do
          expect(
            bishop.can_move_to_position?(starting_point, end_position)
          ).to eq true
        end
      end

      it "can move one square or multiple squares" do
        one_square = "e6"
        expect(
          bishop.can_move_to_position?(starting_point, one_square)
        ).to eq true

        two_squares = "g8"
        expect(
          bishop.can_move_to_position?(starting_point, two_squares)
        ).to eq true
      end
    end

    context "illegal moves" do
      it "recognizes illegal moves" do
        illegal_move = "a5"
        expect(
          bishop.can_move_to_position?(starting_point, illegal_move)
        ).to eq false
      end
    end
  end
end
