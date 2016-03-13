module CounterDynamic where

import Counter
import Array exposing (Array)
import Html exposing (..)
import Html.Events exposing (onClick)

-- MODEL
type alias Model = Array Counter.Model

init : Array Int -> Array Int
init val = val

-- UPDATE
type Action =
  ClickCounter Int Counter.Action
  | AddCounter
  | RemoveCounter


update : Action -> Model -> Model
update action model =
  case action of
    AddCounter ->
      Array.push 0 model
    RemoveCounter ->
      Array.slice 0 -1 model
    ClickCounter index act ->
      let
        val = Maybe.withDefault 0 (Array.get index model)
      in
        Array.set index (Counter.update act val) model

-- VIEW
type alias Payload =
  { address: Signal.Address Action
  , model: Counter.Model
  }

indexedCounterView : Int -> Payload -> Html
indexedCounterView i payload =
  Counter.view (Signal.forwardTo payload.address (ClickCounter i)) payload.model

payloadPacker : Signal.Address Action -> (Counter.Model -> Payload)
payloadPacker address =
  (\model -> { address = address, model = model })

view : Signal.Address Action -> Model -> Html
view address model =
  let
    list_model = Array.toList model
  in
    div []
    [
      button [] [ text (toString model) ],
      div []
      (
        List.indexedMap indexedCounterView
        (List.map (payloadPacker address) list_model)
      ),
      div []
      [ button [ onClick address AddCounter ] [ text "Add" ]
      , button [ onClick address RemoveCounter ] [ text "Remove" ]
      ]
    ]
