qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (n:xs) = qsort lt ++ [n] ++ qsort gteq
    where
        lt   = filter (<  n) xs
        gteq = filter (>= n) xs

main :: IO ()
main = do
    print $ qsort [4, 6, 9, 8, 3, 5, 1, 7, 2]

