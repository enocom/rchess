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

    it "can move to the upper-right" do
      end_position = "f7"
      expect(
        bishop.can_move_to_position?(starting_point, end_position)
      ).to eq true
    end

    it "can move to the upper-left" do
      end_position = "b7"
      expect(
        bishop.can_move_to_position?(starting_point, end_position)
      ).to eq true
    end

    it "can move to the lower-right" do
      end_position = "g2"
      expect(
        bishop.can_move_to_position?(starting_point, end_position)
      ).to eq true
    end

    it "can move to the lower-left" do
      end_position = "b3"
      expect(
        bishop.can_move_to_position?(starting_point, end_position)
      ).to eq true
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

    it "recognizes illegal moves" do
      illegal_move = "a5"
      expect(
        bishop.can_move_to_position?(starting_point, illegal_move)
      ).to eq false
    end
  end
end
