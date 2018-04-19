require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)

    i = index(key, size)
    if @items[i].nil?
      item = Node.new(key, value)
      @items[i] = item
    elsif @items[i].key == key && @items[i].value == value
      return "This is a duplicate"
    else
      j = next_open_index(i)
      if @items[i].key == key && @items[i].value != value && j == -1
        resize
        self[key] = value
      elsif j == -1
        resize
        self[key] = value
        # p @items
      else
        item = Node.new(key, value)
        @items[j] = item
      end
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
    # code working with Logan/Slack Support
    temp = @items
    @items = Array.new(size * 2)
    temp.each do |item|
      unless item.nil?
        node = Node.new(item.key, item.value)
        i = index(item.key, size)
        @items[i] = node
      end
    end

      # create a new node (object with same value) for every item you want to add
      # swap out items = new_array
  end
end

def print_state
  @items.each do |item|
    if !item.nil?
      puts "Node: #{item}, Key: #{item.key}, Value: #{item.value}, Index: #{index(item.key, size)}"
    end
  end
end
