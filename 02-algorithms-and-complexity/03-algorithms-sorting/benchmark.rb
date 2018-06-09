require 'benchmark'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'

collection = Array.new(50) { rand(0..500)}
p collection

Benchmark.bm do |x|
  x.report("insertion_sort: ") { insertion_sort(collection) }
  x.report("selection_sort: ") { selection_sort(collection) }
  x.report("bubble_sort: ") { bubble_sort(collection) }
  x.report("merge_sort: ") { merge_sort(collection) }
  x.report("quick_sort: ") { quick_sort(collection) }
  x.report("heap_sort: ") { heap_sort(collection) }
  x.report("bucket_sort: ") { bucket_sort(collection) }
end
