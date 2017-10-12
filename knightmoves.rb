module KnightMoves
  class Node
    attr_accessor :value, :child
    def initialize(value = nil)
      @value = value
      @children = []
    end

    def add_child(value)
      if @value == nil
        @value = value
      else
        @children << Node.new(value)
      end
    end

  end

  class Knight
    def possible_moves(x,y)
      des = []
      moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]]
      moves.each do |adj|
        a,b = x + adj[0], y + adj[1]
        if valid_move?(a,b)
          des << [a,b]
        end
      end
      return des
    end

    def valid_move?(x,y)
      if x >= 0 && x<= 7 && y >= 0 && y <=7
        return true
      end
      return false
    end
  end
end

test = KnightMoves::Knight.new
p test.possible_moves(3,3)