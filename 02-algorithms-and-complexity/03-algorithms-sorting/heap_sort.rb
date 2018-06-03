def heap_sort(collection)
  last_index = collection.length - 1
  array = collection

# Build Max Heap
  (last_index / 2).downto(0) do |i|
    down_heap(array, i, last_index)
  end

  while last_index > 0
    # swap
    array[0], array[last_index] = array[last_index], array[0]
    last_index -= 1
    down_heap(array, 0, last_index)
  end
  array
end

def down_heap(array, parent, last_index)
  root = array[parent]
  p "root is #{root}"
  p "parent is #{parent}"
  p "last_index is #{last_index}"
  while (child = 2 * parent) <= last_index
    p "child is #{child}"
    if child < last_index && array[child] < array[child + 1]
      child += 1
      p "child is now #{child}"
    end
    break if root >= array[child]
    array[parent] = array[child]
    parent = child
  end
  array[parent] = root
end

unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p heap_sort(unsorted_array)
p heap_sort(unsorted_array2)
