require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)
    if @items[i].nil?
      list = LinkedList.new
      list.add_to_tail(node)
      @items[i] = list
    else
      @items[i].add_to_tail(node)
    end
    @item_count += 1
    if load_factor >= @max_load_factor
      resize
    end
    print_state
  end

  def [](key)
    i = index(key, size)
    if !@items[i].nil?
      current_node = @items[i].head
      while current_node != nil
        if current_node.key == key
          return current_node.value
        else
          current_node = current_node.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @items = Array.new(size * 2)
    temp.each do |item|
      current_node = item.head
      node = Node.new(current_node.key, current_node.value)
      i = index(item.head.key, size)
      if @items[i].nil?
        list = LinkedList.new
        list.add_to_tail(node)
        @items[i] = list
        if load_factor >= @max_load_factor
          self.resize
        end
      else
        @items[i].add_to_tail(node)
        if load_factor >= @max_load_factor
          self.resize
        end
      end
      current_node = current_node.next
    end
  end
end

def print_state
  puts "Hash Load Factor: #{load_factor}"
  @items.each do |item|
    if !item.nil?
      puts "Node: #{item}"
      # puts "Node: #{item}, Key: #{item.key}, Value: #{item.value}, Index: #{item.index(key,size)}"
    end
  end
end
