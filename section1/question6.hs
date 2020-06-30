perpPoint :: (Float, Float) -> (Float, Float, Float) -> (Float, Float)
perpPoint (p, q) (a, b, c) = (x, y)
    where
        x = (a * c + b * d) / (a * a + b * b)
        y = (b * c - a * d) / (a * a + b * b)
        d = b * p - a * q

main = do
    print $ perpPoint (0, 2) (1, -1, 0)

