def heap_sort(collection)
  build_max_heap(collection)

  (collection.length - 1).downto(0) do |i|
    swap(collection, 0, i)
    # swapping root and last nodes, i is last node, 0 is root node
    p collection
    heap_down(collection, i, 0)
    # what is i and what is 0 here?
  end
  collection
end

def build_max_heap(array)
  ((array.length - 1) / 2).downto(0) do |i|
    # why does this begin with (array.length - 1) / 2?
    heap_down(array, array.length, i)
    # i is the parent node index
  end
end

def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def heap_down(array, size, i)
  # in max heap, parent node is always greater than or equal to child nodes
  # in max heap, i is the parent node index?
  # in max heap, size is the size of the array
  l = (2 * i) + 1
  # is this left child index?
  r = (2 * i) + 2
  # is this right child index?
  p "l is #{l}"
  p "r is #{r}"
  p "size is #{size}"
  p "i is #{i}"
  if l < size && array[l] >= array[i]
    # if left child index exists (is less than size of array) and
    # left child value is greater than ?? value
    largest = l
  else
    largest = i
  end
  if r < size && array[r] >= array[largest]
    # if right child index exists (is less than size of array) and
    # right child value is greater than largest value
    largest = r
  end
  p "largest is #{largest}"
  if largest != i
    swap(array, i, largest)
    heap_down(array, size, largest)
  end
end

array = [4, 1, 5, 2, 3]
unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p heap_sort(array)
p heap_sort(unsorted_array)
p heap_sort(unsorted_array2)
