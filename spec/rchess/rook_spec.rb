require "spec_helper"

describe Rchess::Rook do
  it "returns its single letter name" do
    lowercase_rook = Rchess::Rook.new(:lowercase)
    uppercase_rook = Rchess::Rook.new(:uppercase)

    expect(lowercase_rook.letter).to eq "r"
    expect(uppercase_rook.letter).to eq "R"
  end
end
