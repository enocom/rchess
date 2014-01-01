require "spec_helper"

describe Rchess::Knight do
  it "returns its single letter name" do
    lowercase = Rchess::Knight.new(:lowercase)
    uppercase = Rchess::Knight.new(:uppercase)

    expect(lowercase.letter).to eq "n"
    expect(uppercase.letter).to eq "N"
  end
end
