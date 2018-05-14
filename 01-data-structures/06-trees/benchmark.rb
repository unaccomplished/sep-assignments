require 'benchmark'
require_relative 'binary_tree/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

n = 10000
# 100000 was taking too long, so changed 100000 to 10000
tree_root = Node.new(1, 1)
heap_root = Node.new(10000, 10000)
tree = BinarySearchTree.new(tree_root)
heap = MinBinaryHeap.new(heap_root)

Benchmark.bm do |x|
  x.report("insert numbers 1 to 10000 into tree: ") { for i in 1..n; node = Node.new(i, i); tree.insert(tree_root, node); end }
  x.report("insert numbers 1 to 10000 into heap: ") { for i in 1..n; node = Node.new(i, i); heap.insert(heap_root, node); end }

  x.report("find 5000th element in tree: ") { tree.find(tree_root, 5000) }
  x.report("find 5000th element in heap: ") { heap.find(heap_root, 5000) }

  x.report("remove 5000th element in tree: ") { tree.delete(tree_root, 5000) }
  x.report("remove 5000th element in heap: ") { heap.delete(heap_root, 5000) }
end
