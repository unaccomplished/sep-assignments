def selection_sort(collection)
   length = collection.length
   for i in 0..length - 2
     min_index = i
     for j in (i + 1)...length
       if collection[j] < collection[min_index]
         min_index = j
       end
     end

     tmp = collection[i]
     collection[i] = collection[min_index]
     collection[min_index] = tmp
   end
   collection
 end

 unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
 unsorted_array2 = [500, -20, 34, 55, 102, -42]
 p selection_sort(unsorted_array)
 p selection_sort(unsorted_array2)
