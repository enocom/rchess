module Rchess
  class Pawn
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @lettercase = lettercase
      @name = :pawn
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "P" : "p"
    end
  end
end
