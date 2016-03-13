module Counter2 where

import Counter
import Html exposing (..)
import Html.Events exposing (onClick)

-- MODEL
type alias Model =
  { topCounter : Counter.Model
  , bottomCounter : Counter.Model
  }

init : Int -> Int -> Model
init topVal bottomVal =
  { topCounter = Counter.init topVal
  , bottomCounter = Counter.init bottomVal
  }


-- UPDATE
type Action =
  ResetAction
  | TopAction Counter.Action
  | BottomAction Counter.Action


update : Action -> Model -> Model
update action model =
  case action of
    TopAction act ->
      { model | topCounter = Counter.update act model.topCounter }
    BottomAction act ->
      { model | bottomCounter = Counter.update act model.bottomCounter }
    ResetAction ->
      init 0 0


-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
  div []
  [ Counter.view (Signal.forwardTo address TopAction) model.topCounter
  , Counter.view (Signal.forwardTo address BottomAction) model.bottomCounter
  , button [ onClick address ResetAction ] [ text "Reset" ]
  ]
