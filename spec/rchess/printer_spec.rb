require "spec_helper"

describe Rchess::Printer do
  include ChessGameStrings

  it "clears the screen and prints a board" do
    fake_stdout = double("stdout")
    simple_board  = [
      "R", "N", "B", "K", "Q", "B", "N", "R",
      "P", "P", "P", "P", "P", "P", "P", "P",
      " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ",
      "P", "P", "P", "P", "P", "P", "P", "P",
      "R", "N", "B", "K", "Q", "B", "N", "R",
    ]

    printer = Rchess::Printer.new(fake_stdout)

    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(starting_board)

    printer.print_board(simple_board)
  end
end
