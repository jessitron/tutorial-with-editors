module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Events


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { counter : Int }


model =
    { counter = 0 }



-- UPDATE


type Msg
    = Noop
    | Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Decrement ->
            model

        Increment ->
            { model | counter = model.counter + 1 }

        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.text (toString model.counter)
        , Html.button [ Html.Events.onClick Increment ] [ Html.text "+" ]
        ]
