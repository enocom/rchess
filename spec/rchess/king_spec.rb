require "spec_helper"

describe Rchess::King do
  it "returns its single letter name" do
    lowercase = Rchess::King.new(:lowercase)
    uppercase = Rchess::King.new(:uppercase)

    expect(lowercase.letter).to eq "k"
    expect(uppercase.letter).to eq "K"
  end
end
