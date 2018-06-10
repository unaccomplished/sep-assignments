def linear_search(n)
  (1..n).each do |num|
    puts "Worst case for #{num}: #{num} iterations"
  end
end

linear_search(10)
