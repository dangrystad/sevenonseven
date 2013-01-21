fib_rec := method( n,
    if(n > 2, fib_rec(n-1) + fib_rec(n-2), 1)
)
