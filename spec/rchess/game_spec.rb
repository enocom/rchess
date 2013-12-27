require "spec_helper"

describe Rchess::Game do
  include ChessGameStrings

  it "clears the screen, prints a starting board, and prompts the user" do
    fake_stdout = double("stdout")

    game = Rchess::Game.new(Rchess::Printer.new(fake_stdout),
                            Rchess::Board.new)

    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(starting_board)
    expect(fake_stdout).to receive(:print).with(user_prompt)
    game.play
  end
end
