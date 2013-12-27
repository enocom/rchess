require "spec_helper"

describe Rchess::Printer do
  include ChessGameStrings

  it "clears the screen and prints a board" do
    fake_stdout = double("stdout")
    printer = Rchess::Printer.new(fake_stdout)

    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(starting_board)

    printer.print_board(Rchess::Board.new)
  end
end
