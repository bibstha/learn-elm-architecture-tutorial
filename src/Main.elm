module Main where

import Counter exposing (update, view)
import StartApp.Simple exposing (start)

mymethod : String String -> String -> String
mymethod x y = "123"

c = mymethod ("a", "b") "c"

main =
  start { model = 0, update = update, view = view }

