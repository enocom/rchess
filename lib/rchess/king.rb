module Rchess
  class King
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :king
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "K" : "k"
    end
  end
end
