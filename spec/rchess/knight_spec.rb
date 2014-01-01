require "spec_helper"

describe Rchess::Knight do
  it "returns its single letter name" do
    lowercase = Rchess::Knight.new(:lowercase)
    uppercase = Rchess::Knight.new(:uppercase)

    expect(lowercase.letter).to eq "n"
    expect(uppercase.letter).to eq "N"
  end

  describe "movement on the board" do
    let(:knight) { Rchess::Knight.new(:uppercase) }
    let(:start_position) { "5d" }

    it "recognizes illegal moves" do
      illegal_move = "5c"
      expect(
        knight.can_move_to_position? start_position, illegal_move
      ).to eq false
    end

    describe "moving upward" do
      it "can move one up and two left" do
        end_position = "6b"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move one up and two right" do
        end_position = "6f"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two up and one left" do
        end_position = "7c"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two up and one right" do
        end_position = "7e"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end
    end

    describe "moving downward" do
      it "can move one down and two left" do
        end_position = "4b"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move one down and two right" do
        end_position = "4f"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two down and one left" do
        end_position = "3c"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two down and one right" do
        end_position = "3e"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end
    end
  end
end
