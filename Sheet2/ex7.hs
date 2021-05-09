import Data.Char

data CalculatorInput = Exit | Error String | Operator (Int -> Int -> Int) | Number Int

instance Show CalculatorInput where
  show Exit = "Exit"
  show (Error xs) = "Invalid Input: " ++ xs
  show (Operator _) = "Operator _"
  show (Number i) = "Number " ++ (show i)

isNumberS :: String -> Bool
isNumberS s@(x:xs) = and (map isDigit s)
isNumberS _ = False

parseCalculatorInput :: String -> CalculatorInput
parseCalculatorInput ('-':xs) | isNumberS xs = Number (-((read xs) :: Int))
parseCalculatorInput (c:[]) | c == '+' = Operator (+)
                            | c == '-' = Operator (-)
                            | c == '*' = Operator (*)
                            | c == '/' = Operator div
parseCalculatorInput (x:xs) | isSpace x = parseCalculatorInput xs
                            | isNumberS (x:xs) = Number ((read (x:xs)) :: Int)
parseCalculatorInput xs | elem (map toLower xs) ["q", "e", "exit", "quit"] = Exit
                        | otherwise = Error xs


-- exercise:

main :: IO ()
main = do
  -- task a)
  putStrLn "Welcome to the simple Haskell calculator!"
  simpleCalculator 0 (\_ y -> y)
  putStrLn "Bye!"
  return ()

getInput :: IO CalculatorInput
getInput = do
  -- task b)
  putChar '>' 
  input <- getLine 
  return (parseCalculatorInput input)

simpleCalculator :: Int -> (Int -> Int -> Int) -> IO ()
simpleCalculator ans op = do
  -- task c)
  input <- getInput
  case input of
    Exit -> return ()
    Error str -> putStrLn (show (Error str)) >> putStrLn (show ans) >> simpleCalculator ans op   
    Operator f -> simpleCalculator ans f 
    Number n -> putStrLn (show (op ans n)) >> simpleCalculator (op ans n) op


main_e :: IO ()
main_e = do
  -- task a)
  putStrLn "Welcome to the simple Haskell calculator!"
  comp <- simpleCalculator_e 0 0 (\_ y -> y)
  putStrLn ("you made " ++ (show comp) ++ " computations")
  return ()    

simpleCalculator_e :: Int -> Int -> (Int -> Int -> Int) -> IO (Int)
simpleCalculator_e comp ans op = do
  -- task c)
  input <- getInput
  case input of
    Exit -> return (comp)
    Error str -> putStrLn (show (Error str)) >> putStrLn (show ans) >> simpleCalculator_e comp ans op   
    Operator f -> simpleCalculator_e comp ans f 
    Number n -> putStrLn (show (op ans n)) >> simpleCalculator_e (comp+1) (op ans n) op
   
  



