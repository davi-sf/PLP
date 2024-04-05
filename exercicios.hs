-- Função que verifica se um número é par
isEven :: Int -> Bool
isEven n
    | n `mod` 2 == 0 = True
    | otherwise = False

-- Função que retorna o menor entre dois números
smallestNumber :: Int -> Int -> Int
smallestNumber x y
    | x > y = y
    | otherwise = x

-- Função que retorna o menor entre três números
smallestNumber3 :: Int -> Int -> Int -> Int
smallestNumber3 x y z 
    | x <= y && x <= z = x
    | y <= x && y <= z = y
    | otherwise = z

-- Função que calcula o fatorial de um número
fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1)

-- Função que retorna o comprimento de uma lista
listLength :: [Int] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

-- Função que conta quantas vezes um elemento ocorre em uma lista
occurCount :: [Int] -> Int -> Int
occurCount [] _ = 0
occurCount (a:xs) n
    | a == n = 1 + occurCount xs n
    | otherwise = occurCount xs n

-- Função que verifica se um elemento ocorre apenas uma vez em uma lista
uniqueOccurrence :: [Int] -> Int -> Bool
uniqueOccurrence lista n = occurrencesCount lista n == 1

-- Função auxiliar para contar ocorrências de um elemento em uma lista
occurrencesCount :: [Int] -> Int -> Int
occurrencesCount [] _ = 0
occurrencesCount (a:xs) n
    | a == n = 1 + occurrencesCount xs n
    | otherwise = occurrencesCount xs n

-- Função que filtra os elementos maiores que um número em uma lista
greaterThan :: [Int] -> Int -> [Int]
greaterThan [] _ = []
greaterThan (a:xs) n
    | a > n = a : greaterThan xs n
    | otherwise = greaterThan xs n

-- Função que inverte os elementos de uma lista
reversedList :: [Int] -> [Int]
reversedList [] = []
reversedList (a:xs) = reversedList xs ++ [a]

-- Função que implementa o algoritmo de ordenação quicksort
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort [x] = [x]
quickSort (pivot:xs) = quickSort left ++ [pivot] ++ quickSort right
    where
        left = filter (pivot >) xs
        right = filter (pivot <=) xs

-- Função que converte elementos negativos de uma lista em positivos
positiveConversion :: [Int] -> [Int]
positiveConversion [] = []
positiveConversion (a:xs) 
    | a < 0 = abs a : positiveConversion xs
    | otherwise = a : positiveConversion xs

-- Função que concatena duas listas
concatenatedList :: [a] -> [a] -> [a]
concatenatedList list1 list2 = list1 ++ list2

-- Função que duplica os elementos de uma lista
duplicatedElements :: [Int] -> [Int]
duplicatedElements [] = []
duplicatedElements (a:xs) = a : a : duplicatedElements xs

-- Função que implementa o algoritmo de ordenação mergesort
mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [a] = [a]
mergesort xs = merge (mergesort (firstHalf xs)) (mergesort (secondHalf xs))

-- Função auxiliar que retorna a primeira metade de uma lista
firstHalf :: [a] -> [a]
firstHalf xs = take (div (length xs) 2) xs

-- Função auxiliar que retorna a segunda metade de uma lista
secondHalf :: [a] -> [a]
secondHalf xs = drop (div (length xs) 2) xs

-- Função auxiliar que combina duas listas ordenadas em uma única lista ordenada
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
