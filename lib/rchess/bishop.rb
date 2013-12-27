module Rchess
  class Bishop
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :bishop
      @lettercase = lettercase
    end

    def to_s
      @lettercase == :uppercase ? "B" : "b"
    end
  end
end
