def space_complexity(*arrays)
  return arrays.flatten.sort
end

puts space_complexity([3,2,1], [6,5,5], [9,8,7])
