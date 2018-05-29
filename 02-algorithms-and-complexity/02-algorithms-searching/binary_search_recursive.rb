def binary_search_recursive(collection, value)

 low = 0
 high = collection.length - 1

 if low > high || value < collection[low]
   return "value of #{value} not found in this array"
 end

 mid = (low + high) / 2

 if collection[mid] == value
   return "found value of #{value}"
 elsif collection[mid] > value
   new_collection = collection[low..(mid-1)].map { |x| x }
   binary_search_recursive(new_collection, value)
 elsif collection[mid] < value
   new_collection = collection[(mid+1)..high].map { |x| x }
   binary_search_recursive(new_collection, value)
 end

end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

puts binary_search_recursive(array, 2)
puts binary_search_recursive(array, 7)
puts binary_search_recursive(array, 16)
puts binary_search_recursive(array, 19)
puts binary_search_recursive(array, 21)
puts binary_search_recursive(array, -1)
puts binary_search_recursive(array, 0)
