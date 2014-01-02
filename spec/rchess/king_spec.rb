require "spec_helper"

describe Rchess::King do
  it "returns its single letter name" do
    lowercase = Rchess::King.new(:lowercase)
    uppercase = Rchess::King.new(:uppercase)

    expect(lowercase.letter).to eq "k"
    expect(uppercase.letter).to eq "K"
  end

  describe "moving on the board" do
    let(:king) { Rchess::King.new(:uppercase) }
    let(:starting_point) { "d5" }

    it "moves one square vertically or horizontally" do
      %w(d6 d4 c5 e5).each do |new_position|
        expect(
          king.can_move_to_position?(starting_point, new_position)
        ).to eq true
      end
    end

    it "moves one square diagonally" do
      %w(c4 c6 e6 e4).each do |new_position|
        expect(
          king.can_move_to_position?(starting_point, new_position)
        ).to eq true
      end
    end

    it "recognizes illegal moves" do
      %w(b5 b4).each do |illegal_move|
        expect(
          king.can_move_to_position?(starting_point, illegal_move)
        ).to eq false
      end
    end
  end
end
