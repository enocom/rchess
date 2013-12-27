module Rchess
  class Knight
    attr_reader :name, :lettercase

    def initialize(lettercase=:uppercase)
      @name = :knight
      @lettercase = lettercase
    end

    def to_s
      @lettercase == :uppercase ? "N" : "n"
    end
  end
end
