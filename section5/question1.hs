import System.Random

suffle :: [a] -> IO [a]
suffle [] = return []
suffle xs =
    (getStdRandom $ randomR (0, length xs - 1) :: IO Int) >>= \n ->
    (suffle $ take n xs ++ drop (n + 1) xs) >>= \xs' ->
    return $ (xs !! n) : xs'

main :: IO ()
main = do
    suffle [1..9] >>= print

