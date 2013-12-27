module Rchess
  class EmptySquare
    attr_reader :name

    def initialize
      @name = :empty
    end

    def to_s
      " "
    end
  end
end
