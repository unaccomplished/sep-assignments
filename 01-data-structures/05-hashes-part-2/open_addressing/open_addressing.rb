require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = Node.new(key, value)
    i = index(key, size)
    if @items[i].nil?
      @items[i] = item
    else
      j = next_open_index(i)
      if j == -1
        resize
      end
      @items[j] = item
    end
    print_state
  end

  def [](key)
    i = index(key, size)
    if @items[i]
      return @items[i].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    if index >= size
      return -1
    else
      return index
    end
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

def print_state
  @items.each do |item|
    if !item.nil?
      puts "Node: #{item}, Key: #{item.key}, Value: #{item.value}, Index: #{index(item.key, size)}"
    end
  end
end
