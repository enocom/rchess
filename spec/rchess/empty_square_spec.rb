require "spec_helper"

describe Rchess::EmptySquare do
  it "gives an underscore for its letter" do
    empty_square = Rchess::EmptySquare.new
    expect(empty_square.letter).to eq "_"
  end
end
