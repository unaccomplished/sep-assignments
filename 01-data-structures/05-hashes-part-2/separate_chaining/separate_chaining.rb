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
      # resize
    end
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each do |item|
      self[item.key] = item.value
    end
  end
end
