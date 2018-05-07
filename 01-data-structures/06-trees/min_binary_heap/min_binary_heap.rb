require_relative 'node'

class MinBinaryHeap

  attr_reader :root

  def initialize(root)
    @root = root
    # @items = Array.new(size)
  end

  # uses depth first search to find the appropriate place to add the data and
  # adds it as a new Leaf
  def insert(root, node)
    # puts ""
    # puts "Inserting " + node.title + "..."
    # puts ""
    # p root
    # p node
    # 1. Insert a new node at the end of the Heap
      if root.left.nil?
        # puts "left of root is nil, inserting node there"
        root.left = node
        node.parent = root
      elsif root.right.nil? && root.left != nil
        # puts "right of root is nil, but left of root is not nil, inserting node there"
        root.right = node
        node.parent = root
      elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        # puts "root.left's nodes are occupied, inserting node in root.right"
        insert(root.right, node)
      else
        # puts "inserting node in root.left, it didn't fit anywhere else"
        insert(root.left, node)
      end
      # puts ""
      # printf
      # puts ""
      # 2. Compare the value of the new child node with its parent.
      if node.rating < root.rating
        # puts "new node is less than root, swapping!"
        swap(root, node)
      end
      # 4. Repeat step 2 and 3 until the Heap property holds.
      # puts "Finished inserting."
      # puts ""
  end

  def swap(root, node)
    swapped_node = Node.new(root.title, root.rating)
    swapped_node.left = node.left
    swapped_node.right = node.right

    if root == @root
      @root = node
    end
    if root.left == node
      node.left = root
      node.right = root.right
      node.parent = root.parent
      # puts "root after left swap:" + root.inspect
    else
      node.right = root
      node.left = root.left
      node.parent = root.parent
      puts ##
    end
    root.left = swapped_node.left
    root.right = swapped_node.right
    # puts "node after full swap: " + node.inspect
    # puts "root after full swap: " + root.inspect

    # if root.parent.nil?
    #   @root = root
    # end

  end

  # def swap(root, node)
  #   root_parent = root.parent
  #   root_left = root.left
  #   root_right = root.right
  #
  #   node_left = node.left
  #   node_right = node.right
  #
  #   if !root_parent.nil?
  #     if root_parent.left == root
  #       root_parent.left = node
  #     else
  #       root_parent.right = node
  #     end
  #   end
  #
  #   if root_left == node
  #     node.left = root
  #   else
  #     node.left = root_left
  #   end
  #
  #   if root_right == node
  #     node.right = root
  #   else
  #     node.right = root_right
  #   end
  #
  #   node.right = root_right
  #   node.parent = root_parent
  #
  #   root.left = node_left
  #   root.right = node_right
  #   root.parent = node
  #
  #   node = root
  #   root = root.parent
  #
  #   # p root
  #   # p node
  #
  #
  #   # if root.parent.nil?
  #   #   @root = root
  #   # elsif root.parent.rating > root.rating
  #   #   swap(root.parent, root)
  #   # end
  #   #
  #   # puts ""
  #   # printf
  #   # puts ""
  #
  # end


  # Recursive Depth First Search: returns a Node object which contains the data,
  # if found.
  def find(root, data)
    if data.nil? || root.nil?
      return nil
    end
    if root.title == data
      return root
    else
      node = find(root.left, data)
      if node.nil?
        node = find(root.right, data)
      end
    end
    return node
  end

  # this function removes the Node which contains the given data without losing
  # any other Nodes in the Tree. The Tree must remain a Binary Search Tree after
  # each deletion.
  def delete(root, data)
    to_delete = find(root, data)
    if to_delete.nil?
      return nil
    else
      to_delete.title = nil
      to_delete.rating = nil
    end
  end

  # Recursive Breadth First Search: this function prints each node's data of the
  # tree on a single line from top to bottom.
  def printf(children=nil)
    children_array = [@root]
    children_array.each do |child|
      if child.left
        children_array << child.left
      end
      if child.right
        children_array << child.right
      end
    end

    children_array.each do |child|

      puts "#{child.title}: #{child.rating}"
      # Uncomment below for troubleshooting to see node's parent/left/right
      puts "Node: #{child}, Left Node: #{child.left}, Right Node: #{child.right}, Parent Node: #{child.parent}"
    end
  end
end

adaptation = Node.new("Adaptation", 91)
legends_of_the_fall = Node.new("Legends of the Fall", 56)
gone_with_the_wind = Node.new("Gone With The Wind", 92)
fifth_element = Node.new("The Fifth Element", 72)
schindlers_list = Node.new("Schindler's List", 97)
v_for_vendetta = Node.new("V for Vendetta", 73)
apartment = Node.new("The Apartment", 93)
mother = Node.new("Mother", 90)
love_actually = Node.new("Love Actually", 63)
leon = Node.new("Leon", 71)
pride_and_prejudice = Node.new("Pride and Prejudice", 85)
dirty_rotten_scoundrels = Node.new("Dirty Rotten Scoundrels", 88)
black_swan = Node.new("Black Swan", 86)

minBinaryHeap = MinBinaryHeap.new(adaptation)

minBinaryHeap.insert(minBinaryHeap.root, legends_of_the_fall)
minBinaryHeap.insert(minBinaryHeap.root, gone_with_the_wind)
minBinaryHeap.insert(minBinaryHeap.root, fifth_element)
minBinaryHeap.insert(minBinaryHeap.root, schindlers_list)
minBinaryHeap.insert(minBinaryHeap.root, v_for_vendetta)
minBinaryHeap.insert(minBinaryHeap.root, apartment)
minBinaryHeap.insert(minBinaryHeap.root, mother)
minBinaryHeap.insert(minBinaryHeap.root, love_actually)
minBinaryHeap.insert(minBinaryHeap.root, leon)
minBinaryHeap.insert(minBinaryHeap.root, pride_and_prejudice)
minBinaryHeap.insert(minBinaryHeap.root, dirty_rotten_scoundrels)
minBinaryHeap.insert(minBinaryHeap.root, black_swan)

minBinaryHeap.printf

# adaptation = Node.new("Adaptation", 5)
# legends_of_the_fall = Node.new("Legends of the Fall", 10)
# gone_with_the_wind = Node.new("Gone With The Wind", 15)
# fifth_element = Node.new("The Fifth Element", 25)
# schindlers_list = Node.new("Schindler's List", 30)
# v_for_vendetta = Node.new("V for Vendetta", 73)
# apartment = Node.new("The Apartment", 93)
# mother = Node.new("Mother", 90)
# love_actually = Node.new("Love Actually", 63)
# leon = Node.new("Leon", 71)
# pride_and_prejudice = Node.new("Pride and Prejudice", 85)
# dirty_rotten_scoundrels = Node.new("Dirty Rotten Scoundrels", 88)
# black_swan = Node.new("Black Swan", 86)
#
# minBinaryHeap = MinBinaryHeap.new(adaptation)
#
# minBinaryHeap.insert(minBinaryHeap.root, legends_of_the_fall)
# minBinaryHeap.insert(minBinaryHeap.root, gone_with_the_wind)
# minBinaryHeap.insert(minBinaryHeap.root, fifth_element)
# minBinaryHeap.insert(minBinaryHeap.root, schindlers_list)
# # minBinaryHeap.insert(minBinaryHeap.root, v_for_vendetta)
# # minBinaryHeap.insert(minBinaryHeap.root, apartment)
# # minBinaryHeap.insert(minBinaryHeap.root, mother)
# # minBinaryHeap.insert(minBinaryHeap.root, love_actually)
# # minBinaryHeap.insert(minBinaryHeap.root, leon)
# # minBinaryHeap.insert(minBinaryHeap.root, pride_and_prejudice)
# # minBinaryHeap.insert(minBinaryHeap.root, dirty_rotten_scoundrels)
# # minBinaryHeap.insert(minBinaryHeap.root, black_swan)
#
# minBinaryHeap.printf
