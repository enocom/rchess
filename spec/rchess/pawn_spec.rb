require "spec_helper"

describe Rchess::Pawn do
  it "returns its single letter name" do
    lowercase = Rchess::Pawn.new(:lowercase)
    uppercase = Rchess::Pawn.new(:uppercase)

    expect(lowercase.letter).to eq "p"
    expect(uppercase.letter).to eq "P"
  end
end
