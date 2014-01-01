require "spec_helper"

describe Rchess::Queen do
  it "returns its single letter name" do
    lowercase = Rchess::Queen.new(:lowercase)
    uppercase = Rchess::Queen.new(:uppercase)

    expect(lowercase.letter).to eq "q"
    expect(uppercase.letter).to eq "Q"
  end
end
