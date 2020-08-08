import System.Random

shuffle :: (Show a) => [a] -> IO [a]
shuffle [] = return []
shuffle xs = do
    n <- randomRIO (0, length xs - 1) :: IO Int
    xs' <- shuffle $ take n xs ++ drop (n + 1) xs
    return $ (xs !! n) : xs'

main :: IO ()
main = do
    print =<< shuffle [1..10]
    print =<< shuffle [1..10]
    print =<< shuffle [1..10]
    print =<< shuffle [1..10]
    print =<< shuffle [1..10]

