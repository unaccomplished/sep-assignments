def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p merge_sort(unsorted_array)
p merge_sort(unsorted_array2)
