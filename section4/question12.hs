bswap = foldr (\x xs -> case xs of
    [] -> [x]
    (y:ys)
        | x > y     -> y:x:ys
        | otherwise -> x:y:ys) []

main :: IO ()
main = do
    print $ bswap [4, 3, 1, 5, 2]

