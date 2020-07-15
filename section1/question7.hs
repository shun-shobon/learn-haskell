import Data.Char

rot13ch :: Char -> Char
rot13ch ch
    |  'A' <= ch && ch <= 'M'
    || 'a' <= ch && ch <= 'm' = chr $ ord ch + 13
    |  'N' <= ch && ch <= 'Z'
    || 'n' <= ch && ch <= 'z' = chr $ ord ch - 13
    | otherwise               = ch

rot13 :: [Char] -> [Char]
rot13 ""     = ""
rot13 (x:xs) = rot13ch x : rot13 xs

main :: IO ()
main = do
    print hello13
    print $ rot13 hello13
    where
        hello13 = rot13 "Hello, World!"

