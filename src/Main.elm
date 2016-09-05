module Main exposing (main)

import Html exposing (Html)
import Html.App


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


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model

        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] [ Html.text (toString model.counter) ]
