module Main exposing (main)

import Html exposing (Html)
import Html.App


main : Program Never
main =
    { model = init
    , update = update
    , view = view
    }
        |> Html.App.beginnerProgram



-- MODEL


type alias Model =
    {}


init =
    {}



-- UPDATE


type Msg
    = Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Reset ->
            init



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] []
