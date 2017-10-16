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

    def breadth_first_search(target)
      queue = [self]
      hierarchy = {}
      node = queue.shift
      start = node.value
      if start == target
        return start
      end
      node.children.each do |child|
        queue.push([child, start])
      end

      while ! queue.empty?
        node, parent = queue.shift
        hierarchy[node.value] = parent
        if node.value == target
          return solution_path(start, node.value, hierarchy)
        else
          node.children.each do |child|
            queue.push([child,node.value]) 
          end
        end
      end
      return nil
    end

    def solution_path(start, last, hierarchy)
      path = [last]
      temp = hierarchy[last]
      while temp != start
        path.unshift(temp)
        temp = hierarchy[temp]
      end
      path.unshift(start)
      return path
    end


  end

  class Knight

    def intialize
    end

    def possible_moves(x,y)
      des = []
      moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]]
      moves.each do |adj|
        a,b = x + adj[0], y + adj[1]
        if valid_move?(a,b)
          des.push([a,b])
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
      root = moves_tree(start,goal)
      path = root.breadth_first_search(goal)
      puts "You made it in #{path.length - 1} Here's your path:" 
      path.each {|ele| p ele}
    end

    def moves_tree(start, goal)
      root = Node.new(start)
      next_moves = possible_moves(root.value[0],root.value[1])
      next_moves.each do |position|
        root.add_child(position)
      end
      visited = next_moves
      temp = root.children
      next_children = []
      while ! visited.include?(goal)
        temp.each do |child|
          next_moves = possible_moves(child.value[0], child.value[1])
          next_moves.each do |position|
            if ! visited.include?(position)
              child.add_child(position)
              visited = visited.push(position)
            end
          end
          next_children = next_children + child.children
        end
        temp = next_children
        next_children = []
      end
      return root

    end

  end
end

test = KnightMoves::Knight.new
test.knight_moves([0,0],[1,1])
