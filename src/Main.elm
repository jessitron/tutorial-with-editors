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
    { name : String }


model =
    { name = "" }



-- UPDATE


type Msg
    = Noop
    | Name String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name string ->
            { model | name = string }

        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] [ nameInput model ]


nameInput model =
    Html.input [ Html.Events.onInput Name ] []
