import Data.Array.IO

--modifyArray :: a -> Int -> (b -> c) -> a
modifyArray a i f = writeArray a i =<< f <$> readArray a i

main :: IO ()
main = do
    a <- newArray (0, 2) 0 :: IO (IOUArray Int Int)
    print =<< getElems a
    modifyArray a 1 (+ 5)
    print =<< getElems a

