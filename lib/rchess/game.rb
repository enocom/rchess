module Rchess
  class Game
    def initialize(printer=Printer.new, board=Board.new)
      @printer = printer
      @board = board
    end

    def play
      @printer.print_board @board
    end
  end
end
