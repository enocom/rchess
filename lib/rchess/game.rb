module Rchess
  class Game
    def initialize(printer=Printer.new, board=Board.new, input=$stdin)
      @printer = printer
      @board = board
      @input = input
    end

    def play_one_turn
      @printer.print_board @board
      @printer.prompt_user
    end

    def next_turn
      new_position = @input.gets.chomp
      commit_move(new_position)
      play_one_turn
    end

    def commit_move(position)
      @board.commit_move position
    end
  end
end
