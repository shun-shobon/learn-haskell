map' _ []     = []
map' f (x:xs) = f x : map' f xs

filter' _ []     = []
filter' f (x:xs)
    | f x       = x : filter' f xs
    | otherwise =     filter' f xs

flip' f x y = f y x

foldl' _ v []     = v
foldl' f v (x:xs) = foldl' f (f v x) xs

foldr' _ v []     = v
foldr' f v (x:xs) = f x $ foldr' f v xs

main :: IO ()
main = do
    print $ map' (* 2) [1..5]
    print $ filter' (< 5) [1..9]
    print $ flip' map' [1..5] (* 2)
    print $ foldl' (*) 0 [1..100]
    print $ foldl' (-) 0 [1..5]
    print $ foldr' (-) 0 [1..5]

