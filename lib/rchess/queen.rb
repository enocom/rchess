module Rchess
  class Queen
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :queen
      @lettercase = lettercase
    end

    def to_s
      @lettercase == :uppercase ? "Q" : "q"
    end
  end
end
