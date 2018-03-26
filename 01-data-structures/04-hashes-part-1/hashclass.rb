require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size)
    if @items[i].nil?
      @items[i] = item
    elsif @items[i].key != key
      resize
      self[key] = value
    elsif @items[i].value != value
      resize
      @items[index(item.key, size)] = value
    end
    p @items
    p size
  end

# getter, return value of the key
  def [](key)
    i = index(key, size)
    if @items[i]
      return @items[i].value
    end
  end

  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each do |item|
      self[item.key] = item.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
