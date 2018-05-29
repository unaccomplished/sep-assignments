require 'benchmark'
require_relative 'fibonacci_iterative'
require_relative 'fibonacci_recursive'

Benchmark.bm do |x|
  x.report("Fibonacci Iterative: ") { fib_iterative(20) }
  x.report("Fibonacci Recursive: ") { fib_recursive(20) }
end
