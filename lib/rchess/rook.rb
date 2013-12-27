module Rchess
  class Rook
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :rook
      @lettercase = lettercase
    end

    def to_s
      @lettercase == :uppercase ? "R" : "r"
    end
  end
end
