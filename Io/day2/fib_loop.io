
fib_loop := method ( n,
    sum := 1
    if(n > 3) then (        
        i_1 := 1
        i_2 := 1
        for(i, 3, n, 
            sum = i_1 + i_2
            i_2 := i_1
            i_1 := sum
        )
    )
    sum
)