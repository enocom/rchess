require "spec_helper"

describe Rchess::Rook do
  let(:rook) { Rchess::Rook.new(:uppercase) }

  it "returns its single letter name" do
    lowercase_rook = Rchess::Rook.new(:lowercase)
    uppercase_rook = Rchess::Rook.new(:uppercase)

    expect(lowercase_rook.letter).to eq "r"
    expect(uppercase_rook.letter).to eq "R"
  end

  describe "movement on the board" do
    let(:starting_point) { "d5" }

    [
      [:forward, :d6],
      [:backward, :d4],
      [:left, :e5],
      [:right, :c5]
    ].each do |direction, end_pos|
      it "can move #{direction}" do
        expect(rook.can_move_to_position? starting_point, end_pos).to eq true
      end
    end

    it "recognizes illegal moves" do
      illegal_move = "c6"
      expect(
        rook.can_move_to_position? starting_point, illegal_move
      ).to eq false
    end

    context "identifying intermediate positions" do
      [
        ["right",    "g5", ["e5", "f5"]],
        ["left",     "a5", ["c5", "b5"]],
        ["forward",  "d8", ["d6", "d7"]],
        ["backward", "d2", ["d4", "d3"]]
      ].each do |direction, end_position, intermediate_squares|
        it "returns a list of positions when moving #{direction}" do
          expect(
            rook.intermediate_positions(starting_point, end_position)
          ).to eq intermediate_squares
        end
      end
    end
  end
end
