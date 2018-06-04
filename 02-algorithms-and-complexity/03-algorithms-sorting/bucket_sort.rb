def bucket_sort(collection)
  buckets = []

  collection.each do |num|
    if buckets[num].nil?
      buckets[num] = []
    end
    buckets[num].push(num)
  end

  sorted = []
  buckets.each do |bucket|
    next if bucket.nil?
    if bucket.length > 1
      bucket = bucket_sort(bucket)
    end
    sorted << bucket
  end

  return sorted.flatten
end

unsorted_array = [5, 9, 12, 4, 7, 3, 8, 6]
unsorted_array2 = [500, -20, 34, 55, 102, -42]
p bucket_sort(unsorted_array)
p bucket_sort(unsorted_array2)
