require "rspec"
require "rchess"

Dir[File.join(File.dirname(__FILE__), "../lib/rchess.rb")]
  .each { |f| require f }

require_relative "./chess_game_strings"
