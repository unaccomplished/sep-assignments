def code_optimized(*arrays)
  combined_array = arrays.flatten

  sorted_array = [combined_array.pop]

  for val in combined_array
    length = sorted_array.length
    for i in 0..length
      if val < sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == length - 1
        sorted_array << val
        break
      end
    end
  end

  sorted_array
end

puts code_optimized([3,2,1], [6,5,5], [9,8,7])
