class Node
    attr_accessor :parent, :left, :right, :value
    
    def initialize(value, parent = nil, left = nil, right = nil)
        @value = value
    end

end

class Tree

    def build_tree(array)
        @root = nil
        array.each do |item|
            node = Node.new(item)
            if @root == nil
                @root = node
            else
                parent = @root
                sorted = false
                until sorted == true
                    if parent.value > node.value
                        if parent.left != nil
                            parent = parent.left
                        else
                            node.parent = parent.value
                            parent.left = node
                            sorted = true
                        end
                    else
                        if parent.right != nil
                            parent = parent.right
                        else
                            node.parent = parent.value
                            parent.right = node
                            sorted = true
                        end
                    end
                end
            end
            puts "Node: #{node.value}"
            puts "Node Parent: #{node.parent}"
            puts "Parent: #{parent}"
            puts "Root: #{@root.value}"
            puts 
        end
        parent = @root
        
    end
    
    def breadth_first_search(value)
        search_queue = []
        found = false
        search_queue << @root
        search_queue.each do |node|
            if node.left != nil
                search_queue << node.left
            end
            if node.right != nil
                search_queue << node.right
            end
            if node.value == value
                puts "Found it !" 
                puts node
                found = true
                break
            end
        end
        if found == false
            puts "nil"
        end
    end
    
    def depth_first_search(item)
        search_stack = []
        search_stack << @root
        until search_stack.last == nil
            node = search_stack.pop
            if node.right != nil
                search_stack << node.right
            end
            if node.left != nil
                search_stack << node.left
            end
            if node.value == item
                puts "Found it!"
                puts node
                break
            elsif search_stack.last == nil
                puts "Didn't find it..."
            else
                search_stack.unshift
            end
        end
    end
    
    def dfs_rec(item, search_stack = [@root])
        node = search_stack.pop
        if node.value == item
            puts "Found it!"
            puts node
        else
            if node.right != nil
                search_stack << node.right
            end
            if node.left != nil
                search_stack << node.left
            end
            dfs_rec(item, search_stack)
        end
    end

end

tree = Tree.new
tree.build_tree([4,6,9,1,8,7,3,2,5,10])

puts "Searching for the location of the value 3..."
tree.breadth_first_search(6)

puts "Searching depth-first method for the value 5..."
tree.depth_first_search(5)

puts "Same search, but recursively."
tree.dfs_rec(5)
