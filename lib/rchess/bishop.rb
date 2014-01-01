module Rchess
  class Bishop
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :bishop
      @lettercase = lettercase
    end

    def to_s
      letter
    end

    def letter
      @lettercase == :uppercase ? "B" : "b"
    end
  end
end
