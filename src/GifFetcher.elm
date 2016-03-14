module GifFetcher where

import Html exposing (..)

type alias Model = String

update action model =

view : Signal.Address Action -> Model -> Html
view address model =
  div []
  [
    div [] [ text (toString model) ]
  ]
