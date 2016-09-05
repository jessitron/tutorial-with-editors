module Main exposing (main)

import Html exposing (Html)
import Html.App


main : Program Never
main =
    { model = {}
    , update = update
    , view = view
    }
        |> Html.App.beginnerProgram



-- MODEL


type alias Model =
    {}



-- UPDATE


type Msg
    = Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Reset ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] []
