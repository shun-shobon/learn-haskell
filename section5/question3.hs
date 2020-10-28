import Control.Applicative
import System.Random

replicateM' 0 _         = return []
replicateM' n a | n > 0 = (:) <$> a <*> replicateM' (n - 1) a

replicateM_' 0 _         = return []
replicateM_' n a | n > 0 = a >> replicateM_' (n - 1) a

forM' []     _ = return []
forM' (x:xs) f = (:) <$> f x <*> forM' xs f

forM_' []     _ = return []
forM_' (x:xs) f = f x >> forM_' xs f

when' b a = if b then a else return ()
unless' b = when' $ not b

main :: IO ()
main = do
    let dice = getStdRandom $ randomR (1, 6) :: IO Int
    print =<< replicateM' 5 dice
    putStrLn "---"
    replicateM_' 3 $ do
        print =<< dice
    putStrLn "---"
    a <- forM' [1..3] $ \i -> do
        print i
        return i
    print a
    putStrLn "---"
    forM_' [1..3] $ \i -> do
        print i
    putStrLn "---"
    let y f = f (y f)
    y $ \f -> do
        r <- dice
        print r
        when' (r /= 1) f
    putStrLn "---"
    y $ \f -> do
        r <- dice
        print r
        unless' (r == 6) f

