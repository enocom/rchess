require "spec_helper"

describe Rchess::Game do
  include ChessGameStrings
  let(:fake_stdout) { double("stdout") }
  let(:fake_stdin) { double("stdin") }
  let(:printer) { Rchess::Printer.new(fake_stdout) }
  let(:board) { Rchess::Board.new }

  describe "initialization" do
    it "clears the screen, prints a starting board, and prompts the user" do
      game = Rchess::Game.new(printer, board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(starting_board)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.play_one_turn
    end
  end

  it "accepts user input and starts another turn" do
    fake_stdin.stub(:gets).and_return("nc3\n")
    game = Rchess::Game.new(printer, board, fake_stdin)

    expect(fake_stdout).to receive(:print).with(clear_screen)
    expect(fake_stdout).to receive(:print).with(knight_to_c3)
    expect(fake_stdout).to receive(:print).with(user_prompt)
    game.next_turn
  end

  describe "bad or illegal input" do
    it "prints a warning after bad user input" do
      fake_stdin.stub(:gets).and_return("bananas\n")
      game = Rchess::Game.new(printer, board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(starting_board)
      expect(fake_stdout).to receive(:print).with(bad_input_message)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.next_turn
    end

    it "prints an error if the move is illegal" do
      fake_stdin.stub(:gets).and_return("nd5\n")
      game = Rchess::Game.new(printer, board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(starting_board)
      expect(fake_stdout).to receive(:print).with(illegal_move_message)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.next_turn
    end
  end
end
