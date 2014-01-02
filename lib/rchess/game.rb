module Rchess
  class Game
    def initialize(printer=Printer.new, board=Board.new, input=$stdin)
      @printer = printer
      @board = board
      @input = input
    end

    def play
      play_one_turn

      loop { next_turn }
    end

    def play_one_turn(input=:valid)
      @printer.print_board @board
      if input == :invalid_input
        @printer.bad_input_message
      end
      @printer.prompt_user
    end

    def next_turn
      user_entered_position = @input.gets.chomp
      if valid_input? user_entered_position
        commit_move(user_entered_position)
        play_one_turn
      else
        play_one_turn :invalid_input
      end
    end

    def commit_move(position)
      @board.commit_move position
    end

    private
    def valid_input?(input)
      input =~ /[PpRrNnBbQqKk][a-h][1-8]/
    end
  end
end
