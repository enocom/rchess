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

  def knight_to_c3
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
3  |   |   | n |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
2  | p | p | p | p | p | p | p | p |
   + - + - + - + - + - + - + - + - +
1  | r |   | b | k | q | b | n | r |
   + - + - + - + - + - + - + - + - +
     a   b   c   d   e   f   g   h
    board
  end

  def before_amiguous_move
    <<-board
   + - + - + - + - + - + - + - + - +
8  | R | N | B | K | Q |   |   | R |
   + - + - + - + - + - + - + - + - +
7  | P |   |   |   | P | P | B | P |
   + - + - + - + - + - + - + - + - +
6  |   |   | P | P |   | N | P |   |
   + - + - + - + - + - + - + - + - +
5  |   | P |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
4  |   |   |   | p | p |   |   |   |
   + - + - + - + - + - + - + - + - +
3  |   |   | n |   | b | p |   |   |
   + - + - + - + - + - + - + - + - +
2  | p | p | p | k |   |   | p | p |
   + - + - + - + - + - + - + - + - +
1  | r |   |   |   | q | b | n | r |
   + - + - + - + - + - + - + - + - +
     a   b   c   d   e   f   g   h
    board
  end

  def ambiguous_move
    "nge2"
  end

  def before_capture
    <<-board
   + - + - + - + - + - + - + - + - +
8  | R |   | B | K | Q |   |   | R |
   + - + - + - + - + - + - + - + - +
7  | P |   |   | N | P | P | B | P |
   + - + - + - + - + - + - + - + - +
6  |   |   | P | P |   | N | P | b |
   + - + - + - + - + - + - + - + - +
5  |   | P |   |   |   |   |   |   |
   + - + - + - + - + - + - + - + - +
4  |   |   |   | p | p |   |   |   |
   + - + - + - + - + - + - + - + - +
3  |   |   | n |   |   | p |   |   |
   + - + - + - + - + - + - + - + - +
2  | p | p | p | k | n |   | p | p |
   + - + - + - + - + - + - + - + - +
1  | r |   |   |   | q | b |   | r |
   + - + - + - + - + - + - + - + - +
     a   b   c   d   e   f   g   h
    board
  end

  def before_capture_csv
    # Eventually, we will support proper chess notation, e.g.,
    # "e4,d6,d4,Nf6,Nc3,g6,Be3,Bg7,Kd2,c6,f3,b5,Nge2,Nbd7,Bh6,Bxh6"
    #
    # First 16 moves from:
    # Garry Kasparov vs Veselin Topalov, 1999 (Netherlands)
    #
    # capturing move Bxh6
    "pe4,Pd6,pd4,Nf6,nc3,Pg6,be3,Bg7,kd2,Pc6,pf3,Pb5,nge2,Nbd7,bh6"
  end

  def user_prompt
    "\nEnter a move: "
  end

  def bad_input_message
    "\nInvalid input. Please try again.\n"
  end

  def illegal_move_message
    "\nIllegal move. Please try again.\n"
  end
end
