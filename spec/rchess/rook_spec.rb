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
  end
end
