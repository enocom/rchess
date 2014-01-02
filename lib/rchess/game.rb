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

      case input
      when :invalid_input
        @printer.bad_input_message
      when :illegal_move
        @printer.illegal_move_message
      end

      @printer.prompt_user
    end

    def next_turn
      user_entered_position = @input.gets.chomp
      if invalid_input? user_entered_position
        play_one_turn :invalid_input
      elsif commit_move(user_entered_position)
        play_one_turn
      else
        play_one_turn :illegal_move
      end
    end

    def commit_move(position)
      @board.commit_move position
    end

    private
    def invalid_input?(input)
      input !~ /[PpRrNnBbQqKk][a-h][1-8]/
    end
  end
end
