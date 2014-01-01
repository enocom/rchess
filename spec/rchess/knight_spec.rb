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
    let(:start_position) { "d5" }

    it "recognizes illegal moves" do
      illegal_move = "c5"
      expect(
        knight.can_move_to_position? start_position, illegal_move
      ).to eq false
    end

    describe "moving upward" do
      it "can move one up and two left" do
        end_position = "b6"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move one up and two right" do
        end_position = "f6"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two up and one left" do
        end_position = "c7"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two up and one right" do
        end_position = "e7"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end
    end

    describe "moving downward" do
      it "can move one down and two left" do
        end_position = "b4"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move one down and two right" do
        end_position = "f4"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two down and one left" do
        end_position = "c3"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end

      it "can move two down and one right" do
        end_position = "e3"
        expect(
          knight.can_move_to_position? start_position, end_position
        ).to eq true
      end
    end
  end
end
