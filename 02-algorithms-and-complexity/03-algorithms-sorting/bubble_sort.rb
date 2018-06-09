def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false

    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end

# unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
# unsorted_array2 = [500, -20, 34, 55, 102, -42]
# p bubble_sort(unsorted_array)
# p bubble_sort(unsorted_array2)
