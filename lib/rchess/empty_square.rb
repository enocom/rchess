module Rchess
  class EmptySquare
    attr_reader :name

    def initialize
      @name = :empty
    end

    def to_s
      " "
    end

    def letter
      "_"
    end
  end
end
