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

    def play_one_turn(input=:success)
      @printer.print_board @board

      case input
      when :invalid_input
        @printer.invalid_input_message
      when :illegal_move
        @printer.illegal_move_message
      when :ambiguous_move
        @printer.resolve_move_prompt
      end

      @printer.prompt_user
    end

    def next_turn
      user_entered_position = @input.gets.chomp
      if invalid_input? user_entered_position
        play_one_turn :invalid_input
      else
        result = commit_move(user_entered_position)
        play_one_turn result
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
