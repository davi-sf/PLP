regra_tres:: Float -> Float -> Float -> Float
regra_tres n1 n2 n3 = if n2 * n3 /= 0 && n1 /= 0  then (n2 * n3)/n1 else 0.0
main :: IO()
main = do
    input1 <- getLine
    let n1 = read input1 :: Float
    input2 <- getLine
    let n2 = read input2:: Float
    input3 <- getLine
    let n3 = read input3 :: Float
        result = regra_tres n1 n2 n3
    putStrLn ("O valor de x é: "++ show result)
