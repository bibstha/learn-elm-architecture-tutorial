module CounterDynamic where

import Counter
import Html exposing (..)
import Html.Events exposing (onClick)

-- MODEL
type alias Model = List Counter.Model
init = [Counter.init 0]

-- UPDATE
type Action =
  ClickCounter Int Counter.Action
  | AddCounter
  | RemoveCounter


update : Action -> Model -> Model
update action model =
  case action of
    AddCounter ->
      model ++ [Counter.init 0]
    RemoveCounter ->
      List.take (List.length model - 1) model
    ClickCounter index act ->
      let
        updateCounter counterIndex counterModel =
          if counterIndex == index
             then Counter.update act counterModel
             else counterModel

      in
        List.indexedMap updateCounter model

-- VIEW
type alias Payload =
  { address: Signal.Address Action
  , model: Counter.Model
  }


view : Signal.Address Action -> Model -> Html
view address model =
  let
    elements =
      List.indexedMap (viewCounter address) model ++
      [ button [ onClick address AddCounter ] [ text "Add" ]
      , button [ onClick address RemoveCounter ] [ text "Remove" ]
      ]
  in
    div [] elements

viewCounter : Signal.Address Action -> Int -> Counter.Model -> Html
viewCounter address index model =
  Counter.view (Signal.forwardTo address (ClickCounter index)) model

