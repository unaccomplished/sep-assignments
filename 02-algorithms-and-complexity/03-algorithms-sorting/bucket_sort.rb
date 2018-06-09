def bucket_sort(collection, bucket_size = 5)
  # if collection.empty?
  #   return
  # end

  min = collection.min
  max = collection.max

# initialize buckets
  bucket_count = ((max - min) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

# distribute input array values into buckets
  (0..collection.length - 1).each do |i|
    buckets[((collection[i] - min) / bucket_size).floor].push(collection[i])
  end

  # p buckets

# sort buckets and place back into input array
  collection.clear
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
      collection.push(value) unless value.nil?
    end
  end

  collection
end

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

# array = [4, 1, 5, 2, 3]
# unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
# unsorted_array2 = [500, -20, 34, 55, 102, -42]
# p bucket_sort(array)
# p bucket_sort(unsorted_array)
# p bucket_sort(unsorted_array2)
