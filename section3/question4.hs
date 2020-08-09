import System.Random

shuffle :: (Ord a) => [a] -> IO [a]
shuffle [] = return []
shuffle xs = do
    n <- randomRIO (0, length xs - 1) :: IO Int
    xs' <- shuffle $ take n xs ++ drop (n + 1) xs
    return $ (xs !! n) : xs'

isSorted :: (Ord a) => [a] -> Bool
isSorted []  = True
isSorted [_] = True
isSorted (x:y:zs)
    | x > y     = False
    | otherwise = isSorted (y:zs)

bogosort :: (Ord a) => [a] -> IO [a]
bogosort xs = do
    xs' <- shuffle xs
    if isSorted xs' then return xs' else bogosort xs

main :: IO ()
main = do
    xs <- shuffle [1..10]
    print xs
    print =<< bogosort xs

