require "spec_helper"

describe Rchess::Pawn do
  it "returns its single letter name" do
    lowercase = Rchess::Pawn.new(:lowercase)
    uppercase = Rchess::Pawn.new(:uppercase)

    expect(lowercase.letter).to eq "p"
    expect(uppercase.letter).to eq "P"
  end

  describe "movement on the board" do
    let(:starting_position) { "d5" }

    context "intermediate positions" do
      let(:pawn) { Rchess::Pawn.new(:uppercase) }

      context "when not taking its opening move" do
        it "identifies all intermediate positions" do
          expect(pawn.intermediate_positions(starting_position, "d6")).to eq []
        end
      end

      context "when taking its opening move" do
        describe "as an uppercase pawn" do
          it "identifies all intermediate positions" do
            expect(pawn.intermediate_positions("a2", "a4")).to eq ["a3"]
          end
        end

        describe "as a lowercase pawn" do
          lowercase_pawn = Rchess::Pawn.new(:lowercase)

          it "identifies all intermediate positions" do
            expect(
              lowercase_pawn.intermediate_positions("a7", "a5")
            ).to eq ["a6"]
          end
        end
      end
    end

    context "uppercase pawns" do
      let(:pawn) { Rchess::Pawn.new(:uppercase) }

      describe "moving for the first time" do
        it "may move two spaces downward" do
          home_position = "a7"
          two_spaces_down = "a5"

          expect(
            pawn.can_move_to_position?(home_position, two_spaces_down)
          ).to eq true
        end
      end

      it "moves downward" do
        one_square_downward = "d4"
        expect(
          pawn.can_move_to_position?(starting_position, one_square_downward)
        ).to eq true
      end

      it "recognizes illegal moves" do
        %w(c6 d6 e6 e5 c5 c4 e4).each do |illegal_move|
          expect(
            pawn.can_move_to_position?(starting_position, illegal_move)
          ).to eq false
        end
      end

      describe "when capturing" do
        it "allows downward diagonal movement" do
          diagonal_left = "c4"
          expect(
            pawn.can_move_to_position?(starting_position, diagonal_left, :capture)
          ).to eq true

          diagonal_right = "c4"
          expect(
            pawn.can_move_to_position?(starting_position, diagonal_right, :capture)
          ).to eq true
        end
      end
    end

    context "lowercase pawns" do
      # assumes bottom start position for lowercase
      let(:pawn) { Rchess::Pawn.new(:lowercase) }

      it "moves upward" do
        one_square_upward = "d6"
        expect(
          pawn.can_move_to_position?(starting_position, one_square_upward)
        ).to eq true
      end

      it "recognizes illegal moves" do
        %w(c6 e6 c5 e5 d4 c4 e4).each do |illegal_move|
          expect(
            pawn.can_move_to_position?(starting_position, illegal_move)
          ).to eq false
        end
      end

      describe "moving for the first time" do
        it "may move two spaces upward" do
          home_position = "a2"
          two_spaces_down = "a4"

          expect(
            pawn.can_move_to_position?(home_position, two_spaces_down)
          ).to eq true
        end
      end

      describe "when capturing" do
        it "allows upward diagonal movement" do
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
end
