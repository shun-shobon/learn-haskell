import System.IO.Unsafe

--trace' :: (Show a) => a -> b -> b
trace' s x = unsafePerformIO $ do
    putStrLn s
    return x

fact :: Integer -> Integer
fact 0 = trace' "fact 0 = 1" 1
fact n | n > 0 = trace' dbg0 $ trace' dbg1 ret
    where
        ret  = n * fn1
        fn1  = fact $ n - 1
        dbg0 = "fact " ++ show n ++ " = " ++ show n ++ " * fact " ++ show (n - 1)
        dbg1 = dbg0 ++ " = " ++ show n ++ " * " ++ show fn1 ++ " = " ++ show ret

main :: IO ()
main = do
    print $ fact 5

