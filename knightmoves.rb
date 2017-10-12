module KnightMoves
  class Node
    attr_accessor :value, :children
    def initialize(value = nil)
      @value = value
      @children = []
    end

    def add_child(value)
      if @value == nil
        @value = value
      elsif @value != value && @children.none? {|child| child.value == value} 
        @children << Node.new(value)
      end
    end

    def dfs_rec(node, target, memo = [])
      if node == nil
        return
      elsif node.value == target
        memo << node.value
        return memo
      else
        memo << node.value
        node.children.each do |child|
          dfs_rec(child, target, memo)
        end
      end
    end
  end

  class Knight

    def intialize(position)
      @root = Node.new(position)
    end

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

    def knight_moves(start, goal)

      
    end
  end
end

test = KnightMoves::Node.new
p test.add_child([1,2])
p test.add_child([3,1])
p test.add_child([0,0])
test.children.each {|child| child.add_child([3,3])}
p test