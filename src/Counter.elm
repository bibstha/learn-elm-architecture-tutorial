module Counter where

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
-- MODEL
type alias Model = Int
init : Int -> Int
init x = x


-- UPDATE
type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  case action of
    Increment ->
      model + 1
    Decrement ->
      model - 1


-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
  div []
  [ button [ onClick address Decrement ] [ text "-" ]
  , div [] [ text (toString model) ]
  , button [ onClick address Increment ] [ text "+" ]
  ]
