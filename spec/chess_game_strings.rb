module ChessGameStrings
  def clear_screen
    "\e[H\e[2J"
  end

  def starting_board
    <<-board
   + - + - + - + - + - + - + - + - +
8  | R | N | B | K | Q | B | N | R |
   + - + - + - + - + - + - + - + - +
7  | P | P | P | P | P | P | P | P |
   + - + - + - + - + - + - + - + - +
6  |   |   |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
5  |   |   |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
4  |   |   |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
3  |   |   |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
2  | p | p | p | p | p | p | p | p |
   + - + - + - + - + - + - + - + - +
1  | r | n | b | k | q | b | n | r |
   + - + - + - + - + - + - + - + - +
     a   b   c   d   e   f   g   h
    board
  end

  def user_prompt
    "\nEnter a move: "
  end
end
