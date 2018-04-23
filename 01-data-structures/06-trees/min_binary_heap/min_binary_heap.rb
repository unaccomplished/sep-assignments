require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  # uses depth first search to find the appropriate place to add the data and
  # adds it as a new Leaf
  def insert(root, node)
    if root.rating > node.rating
      # p root
      # p node
      temp = root
      @root = node
      node = temp
      insert(@root, node)
      # puts "Swapped those two elements in root.left is nil"
      # p root
      # p node
    # end
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && root.left != nil
        root.right = node
      # if root.rating > node.rating
      #   # p root
      #   # p node
      #   temp = root
      #   @root = node
      #   node = temp
      #   # puts "Swapped those two elements in root.right is nil"
      # end
      elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        insert(root.right, node)
      elsif root.left != nil && root.right != nil
        insert(root.left, node)
      end
    end
  end

def swap(root, node)
  temp = root
  root = node
  node = temp
end

  # Recursive Depth First Search: returns a Node object which contains the data,
  # if found.
  def find(root, data)
    if data.nil? || root.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
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
    end
  end
end

# adaptation = Node.new("Adaptation", 91)
# legends_of_the_fall = Node.new("Legends of the Fall", 56)
# gone_with_the_wind = Node.new("Gone With The Wind", 92)
# fifth_element = Node.new("The Fifth Element", 72)
# schindlers_list = Node.new("Schindler's List", 97)
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
# minBinaryHeap.insert(adaptation, legends_of_the_fall)
# minBinaryHeap.insert(adaptation, gone_with_the_wind)
# minBinaryHeap.insert(adaptation, fifth_element)
# minBinaryHeap.insert(adaptation, schindlers_list)
# minBinaryHeap.insert(adaptation, v_for_vendetta)
# minBinaryHeap.insert(adaptation, apartment)
# minBinaryHeap.insert(adaptation, mother)
# minBinaryHeap.insert(adaptation, love_actually)
# minBinaryHeap.insert(adaptation, leon)
# minBinaryHeap.insert(adaptation, pride_and_prejudice)
# minBinaryHeap.insert(adaptation, dirty_rotten_scoundrels)
# minBinaryHeap.insert(adaptation, black_swan)

# minBinaryHeap.printf
