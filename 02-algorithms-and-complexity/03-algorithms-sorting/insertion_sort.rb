def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end

# unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
# unsorted_array2 = [500, -20, 34, 55, 102, -42]
# p insertion_sort(unsorted_array)
# p insertion_sort(unsorted_array2)
