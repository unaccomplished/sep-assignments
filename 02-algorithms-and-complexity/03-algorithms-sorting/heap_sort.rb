def heap_sort(collection)
  build_max_heap(collection)

  (collection.length - 1).downto(0) do |i|
    swap(collection, 0, i)
    p collection
    heap_down(collection, i, 0)
  end
  collection
end

def build_max_heap(array)
  ((array.length - 1) / 2).downto(0) do |i|
    heap_down(array, array.length, i)
  end
end

def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def heap_down(array, size, i)
  l = (2 * i) + 1
  p "l is #{l}"
  r = (2 * i) + 2
  p "r is #{r}"
  p "size is #{size}"
  p "i is #{i}"
  if l < size && array[l] > array[i]
    largest = l
  else
    largest = i
  end
  if r < size && array[r] > array[largest]
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
# p heap_sort(unsorted_array)
# p heap_sort(unsorted_array2)
