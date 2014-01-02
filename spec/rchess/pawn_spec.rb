require "spec_helper"

describe Rchess::Pawn do
  it "returns its single letter name" do
    lowercase = Rchess::Pawn.new(:lowercase)
    uppercase = Rchess::Pawn.new(:uppercase)

    expect(lowercase.letter).to eq "p"
    expect(uppercase.letter).to eq "P"
  end

  describe "movement on the board" do
    let(:pawn) { Rchess::Pawn.new(:lowercase) } # assumes bottom start position
    let(:starting_position) { "d5" }

    it "moves forward" do
      one_square_forward = "d6"
      expect(
        pawn.can_move_to_position?(starting_position, one_square_forward)
      ).to eq true
    end

    it "recognizes illegal moves" do
      %w(c6 e6 c5 e5 d4 c4 e4).each do |illegal_move|
        expect(
          pawn.can_move_to_position?(starting_position, illegal_move)
        ).to eq false
      end
    end

    describe "when capturing" do
      it "allows forward diagonal movement" do
        diagonal_left = "c6"
        expect(
          pawn.can_move_to_position?(starting_position, diagonal_left, :capture)
        ).to eq true

        diagonal_right = "e6"
        expect(
          pawn.can_move_to_position?(starting_position, diagonal_right, :capture)
        ).to eq true
      end
    end
  end
end
