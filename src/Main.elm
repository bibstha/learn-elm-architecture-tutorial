module Main where

import Counter
import Counter2
import StartApp.Simple exposing (start)


main =
  start { model = 0, update = Counter.update, view = Counter.view }
  -- start
  -- { model = Counter2.init 0 0
  -- , update = Counter2.update
  -- , view = Counter2.view }

