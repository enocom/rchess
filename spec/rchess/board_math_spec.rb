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
end
