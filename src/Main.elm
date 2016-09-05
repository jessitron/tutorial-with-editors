module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events
import String


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { content : String }


model =
    { content = "" }



-- UPDATE


type Msg
    = Noop
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change string ->
            { model | content = string }

        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.input
            [ Html.Attributes.placeholder "Text to reverse"
            , Html.Events.onInput Change
            ]
            []
        , Html.div [] [ Html.text (String.reverse model.content) ]
        ]
