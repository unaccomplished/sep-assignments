require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)

    i = index(key, size())
    if @items[i] == nil
      @items[i] = Node.new(key, value)
    elsif @items[i].key == key && @items[i].value == value
      return "duplicate"
    elsif @items[i].key == key && @items[i].value != value
      @items[i].value = value
    else
      j = next_open_index(i)
      if j == -1
        resize()
        self[key] = value
      else
        @items[j] = Node.new(key, value)
      end
    end
    print_state
  end

  def [](key)
    (0...size()).each do |i|
      if @items[i] != nil
        if @items[i].key == key
          return @items[i].value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are itemsing based on strings, let's use the ascii value of each string as
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

  # Simple method to return the number of items in the items
  def size
    @items.length
  end

  # Resize the items
  def resize
    # code working with Logan/Slack Support
    temp = Array.new(@items.length * 2)
    (0...@items.length).each do |el|
      if @items[el]
        new_index = @items[el].key.sum % temp.length
        temp[new_index] = @items[el]
        @items[el] = nil
      end
    end
    # assign the transfer array to our items array
    @items = temp
  end
end

def print_state
  @items.each do |item|
    if !item.nil?
      puts "Node: #{item}, Key: #{item.key}, Value: #{item.value}, Index: #{index(item.key, size)}"
    end
  end
end
