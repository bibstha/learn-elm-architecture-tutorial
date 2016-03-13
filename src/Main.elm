module Main where

import Html exposing (..)
-- import Counter
-- import Counter2
import CounterDynamic
import StartApp.Simple exposing (start)
import Array exposing (fromList)

main =
  -- start { model = 0, update = Counter.update, view = Counter.view }
  -- start
  -- { model = Counter2.init 0 0
  -- , update = Counter2.update
  -- , view = Counter2.view }
  start
  { model = CounterDynamic.init
  , update = CounterDynamic.update
  , view = CounterDynamic.view
  }

