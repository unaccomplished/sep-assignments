def fib_iterative(n)

  if n == 0
    return 0
  else
    fib_0 = 0
    fib_1 = 1

    for i in 1..(n-1)
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
    end

    return fib_1
  end
end
