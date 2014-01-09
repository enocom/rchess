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

  describe "moving pieces on the board" do
    it "accepts user input and starts another turn" do
      fake_stdin.stub(:gets).and_return("nc3\n")
      game = Rchess::Game.new(printer, board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(knight_to_c3)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.next_turn
    end

    xit "allows capturing" do
      fake_stdin.stub(:gets).and_return("Bh6\n")
      before_capture_board = Rchess::Board.new(before_capture_csv)
      game = Rchess::Game.new(printer, before_capture_board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(before_capture)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.play_one_turn

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(after_capture)
      expect(fake_stdout).to receive(:print).with(user_prompt)
      game.next_turn
    end

    describe "when there is more than one piece implied by a move" do
      it "prompts the user for a more specific move" do
        fake_stdin.stub(:gets).and_return(ambiguous_move)
        board = Rchess::Board.new(ambiguous_knights_csv)
        game = Rchess::Game.new(printer, board, fake_stdin)

        expect(fake_stdout).to receive(:print).with(clear_screen)
        expect(fake_stdout).to receive(:print).with(ambiguous_knights_board)
        expect(fake_stdout).to receive(:print).with(user_prompt)
        expect(fake_stdout).to receive(:print).with(resolve_move_prompt)
        game.next_turn
      end

      it "allows a user to specify an originating file for a move" do
        fake_stdin.stub(:gets).and_return(move_with_originating_file)
        board = Rchess::Board.new(ambiguous_knights_csv)
        game = Rchess::Game.new(printer, board, fake_stdin)

        expect(fake_stdout).to receive(:print).with(clear_screen)
        expect(fake_stdout).to receive(:print).with(originating_file_board)
        expect(fake_stdout).to receive(:print).with(user_prompt)
        game.next_turn
      end
    end
  end

  describe "bad or illegal input" do
    it "prints a warning after invalid user input" do
      fake_stdin.stub(:gets).and_return("bananas\n")
      game = Rchess::Game.new(printer, board, fake_stdin)

      expect(fake_stdout).to receive(:print).with(clear_screen)
      expect(fake_stdout).to receive(:print).with(starting_board)
      expect(fake_stdout).to receive(:print).with(invalid_input_message)
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

    it "recognizes invalid input" do
      game = Rchess::Game.new(printer, board, fake_stdin)
      expect(game.invalid_input? "ne2").to eq false
      expect(game.invalid_input? "nge2").to eq false
      expect(game.invalid_input? "zdg2").to eq true
    end
  end
end
