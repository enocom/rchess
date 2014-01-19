require "spec_helper"

describe Rchess::BoardMath do
  include Rchess::BoardMath

  describe "rotating letters" do
    it "rotates letters forward through the files" do
      expect(rotate_letter("a", 2)).to eq "c"
    end

    it "rotates letters backward through the files" do
      expect(rotate_letter("d", -2)).to eq "b"
    end

    it "wraps letters from 'h' to 'a'" do
      expect(rotate_letter("h", 2)).to eq "b"
    end

    it "wraps letters from 'a' to 'h'" do
      expect(rotate_letter("a", -2)).to eq "g"
    end
  end

  describe "letter differences" do
    it "calculates the numerical difference between letters" do
      expect(letter_difference("a", "b")).to eq 1
    end

    it "calculates negative differences, too" do
      expect(letter_difference("d", "a")).to eq -3
    end

    it "handle wrapping" do
      expect(letter_difference("f", "a")).to eq -5
    end
  end

  describe "rank differences" do
    it "calculates the difference between ranks" do
      expect(rank_difference("1", "2")).to eq 1
    end

    it "calculates negative differences, too" do
      expect(rank_difference("5", "2")).to eq -3
    end

    it "handles wrapping" do
      expect(rank_difference("7", "2")).to eq -5
    end
  end

  describe "finding intermediate positions" do
    let(:start) { "d5" }

    context "diagonal movements" do
      [
        ["upper right", "g8", ["e6", "f7"]],
        ["upper left",  "a8", ["c6", "b7"]],
        ["lower right", "g2", ["e4", "f3"]],
        ["lower left",  "a2", ["c4", "b3"]]
      ].each do |direction, end_pos, intermediate|
        it "finds positions squares leading to the #{direction}" do
          expect(find_intermediate_between(start, end_pos)).to eq intermediate
        end
      end
    end
  end
end
