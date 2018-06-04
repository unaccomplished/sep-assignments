def heap_sort(collection)
  build_max_heap(collection)

  (collection.length - 1).downto(0) do |i|
    swap(collection, 0, i)
    # swapping root and last nodes, i is last node, 0 is root node
    # p collection
    heap_down(collection, i, 0)
    # i is the new last array item in new heap array and 0 the parent node
    # (beginning of the heap array)
  end
  collection
end

def build_max_heap(array)
  ((array.length - 1) / 2).downto(0) do |i|
    # begin with (array.length - 1) / 2 means faster performance
    heap_down(array, array.length, i)
    # i is the parent node index
  end
end

def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def heap_down(array, size, i)
  # parent node is always greater than or equal to child nodes, if not, there
  # be a swap later with recursive heap_down to fix this
  # i is the parent node index
  # size is the size of the array
  l = (2 * i) + 1
  # is this left child index
  r = (2 * i) + 2
  # is this right child index
  # p "l is #{l}"
  # p "r is #{r}"
  # p "size is #{size}"
  # p "i is #{i}"
  if l < size && array[l] >= array[i]
    # if left child index exists (is less than size of array) and
    # left child value is greater than the parent value
    largest = l
  else
    largest = i
  end
  if r < size && array[r] >= array[largest]
    # if right child index exists (is less than size of array) and
    # right child value is greater than largest value
    largest = r
  end
  # p "largest is #{largest}"
  if largest != i
    # largest is not the parent, so a swap needs to occur
    swap(array, i, largest)
    # recursive heap_down with the new largest/parent index re-defined
    heap_down(array, size, largest)
  end
end

array = [4, 1, 5, 2, 3]
unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p heap_sort(array)
p heap_sort(unsorted_array)
p heap_sort(unsorted_array2)
