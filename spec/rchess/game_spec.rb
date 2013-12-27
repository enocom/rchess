require "spec_helper"

describe Rchess::Game do
  include ChessGameStrings

  it "clears the screen and prints a starting board" do
    fake_stdout = double("stdout")

    game = Rchess::Game.new(Rchess::Printer.new(fake_stdout),
                            Rchess::Board.new)

    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(starting_board)
    game.play
  end

  it "accepts user input to move pieces" do
  end

  it "quits gracefully" do
  end
end
