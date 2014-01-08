require "spec_helper"

describe Rchess::Printer do
  include ChessGameStrings
  let(:fake_stdout) { double("stdout") }
  let(:printer) { Rchess::Printer.new(fake_stdout) }

  it "clears the screen and prints a board" do
    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(starting_board)

    printer.print_board(Rchess::Board.new)
  end

  it "prompts the user for a move" do
    expect(fake_stdout).to receive(:print).with(user_prompt)

    printer.prompt_user
  end

  it "displays a bad input message" do
    expect(fake_stdout).to receive(:print).with(invalid_input_message)

    printer.invalid_input_message
  end

  it "displays an illegal move message" do
    expect(fake_stdout).to receive(:print).with(illegal_move_message)

    printer.illegal_move_message
  end

  it "prompts the user to resolve an ambiguous move" do
    expect(fake_stdout).to receive(:print).with(resolve_move_prompt)

    printer.resolve_move_prompt
  end
end
