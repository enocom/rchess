require "spec_helper"

describe Rchess::Bishop do
  it "returns its single letter name" do
    lowercase = Rchess::Bishop.new(:lowercase)
    uppercase = Rchess::Bishop.new(:uppercase)

    expect(lowercase.letter).to eq "b"
    expect(uppercase.letter).to eq "B"
  end
end
