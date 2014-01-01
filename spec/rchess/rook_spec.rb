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
    let(:starting_point) { "5d" }

    it "can move foward" do
      forward = "6d"
      expect(rook.can_move_to_position? starting_point, forward).to eq true
    end

    it "can move backward" do
      backward = "4d"
      expect(rook.can_move_to_position? starting_point, backward).to eq true
    end

    it "can move left" do
      left = "5e"
      expect(rook.can_move_to_position? starting_point, left).to eq true
    end

    it "can move right" do
      right = "5c"
      expect(rook.can_move_to_position? starting_point, right).to eq true
    end

    it "recognizes illegal moves" do
      illegal_move = "6c"
      expect(
        rook.can_move_to_position? starting_point, illegal_move
      ).to eq false
    end
  end
end
