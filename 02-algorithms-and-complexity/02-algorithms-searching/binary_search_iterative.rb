def binary_search_iterative(collection, value)

 low = 0
 high = collection.length - 1

 while low <= high
   mid = (low + high) / 2
   if collection[mid] > value
     high = mid - 1
   elsif collection[mid] < value
     low = mid + 1
   else
     return "found value of #{value} at index #{mid}"
   end
 end

 return "value of #{value} not found in this array"
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

puts binary_search_iterative(array, 2)
puts binary_search_iterative(array, 7)
puts binary_search_iterative(array, 16)
puts binary_search_iterative(array, 19)
puts binary_search_iterative(array, 21)
puts binary_search_iterative(array, -1)
puts binary_search_iterative(array, 0)
