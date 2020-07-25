bswap :: (Ord a) => [a] -> [a]
bswap [x] = [x]
bswap (x:xs)
    | x > y     = y:x:ys
    | otherwise = x:y:ys
    where
        (y:ys) = bswap xs

bsort :: (Ord a) => [a] -> [a]
bsort [] = []
bsort xs = y : bsort ys
    where
        (y:ys) = bswap xs

main = do
    print $ bsort [5, 4, 3, 2, 1]
    print $ bsort [1, 2, 3, 4, 5]
    print $ bsort [3, 5, 2, 1, 5]
    print $ bsort [4, 7, 3, 9, 6, 8, 1, 2, 5]

