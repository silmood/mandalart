import Html exposing (Html, div, ul, li, text, program)

type alias Model =
  { patterns: List Pattern
  }

type alias Pattern =
  { id: Int
  , name: String
  }

init : ( Model, Cmd Msg)
init =
  ( Model [ Pattern 0 "Simple"
          , Pattern 1 "Complex"
          ]
  , Cmd.none
  )

type Msg 
  = NoOp

view : Model -> Html Msg
view model =
  div []
      [ header model.patterns ]

header : List Pattern -> Html Msg
header patterns =
  div []
      [ patterns
        |> List.map patternHeader 
        |> ul [] 
      ]


patternHeader : Pattern -> Html Msg
patternHeader pattern =
  li []
      [ div [] [ Html.text pattern.name ]
      ]

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }