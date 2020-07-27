qsort :: (Ord a) => [a] -> [a]
qsort []     = []
qsort (n:xs) = qsort lt ++ [n] ++ qsort gteq
    where
        lt   = [x | x <- xs, x <  n]
        gteq = [x | x <- xs, x >= n]

main :: IO ()
main = do
    print $ qsort [4, 9, 1, 5, 3, 8, 3, 2, 6]

