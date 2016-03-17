-- displays fancy Hello World
import Color exposing (blue)
import Graphics.Element exposing (Element, leftAligned)
import Text

main : Element
main =
  Text.fromString  "Hello World"
     |> Text.color blue
     |> Text.italic
     |> Text.bold
     |> Text.height 60
     |> leftAligned

