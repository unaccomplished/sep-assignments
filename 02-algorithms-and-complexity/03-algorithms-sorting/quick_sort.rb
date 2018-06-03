def quick_sort(collection)
  if collection.length <= 1
    collection
  else
    n = collection.length - 1
    pivot_point = collection[n]
    sorted_array = []
    lower_array = []
    higher_array = []

    (0..n - 1).each do |i|
      if collection[i] > pivot_point
        higher_array << collection[i]
      else
        lower_array << collection[i]
      end
    end

    sorted_array << quick_sort(lower_array)
    sorted_array << pivot_point
    sorted_array << quick_sort(higher_array)
    sorted_array.flatten
  end
end

unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p quick_sort(unsorted_array)
p quick_sort(unsorted_array2)
