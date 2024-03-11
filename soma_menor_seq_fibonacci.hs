sum_two :: Int ->  Int
sum_two x = if x == 0 then 0 else x `mod` 10 + sum_two (x `div` 10)

menor_sum_fib :: Int -> Int 
menor_sum_fib n = aux 1 1
    where
        aux a b 
            | sum_two a == n = a
            | otherwise = aux b (a+b)

main :: IO()
main = do
    input <- getLine
    let n = read input :: Int
        result = menor_sum_fib n
    print result
    
