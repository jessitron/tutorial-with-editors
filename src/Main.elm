module Main exposing (main)

import Html exposing (Html)
import Html.App


main : Program Never
main =
    { model = model
    , update = update
    , view = view
    }
        |> Html.App.beginnerProgram



-- MODEL


type alias Model =
    {}


model =
    {}



-- UPDATE


type Msg
    = Noop


update : Msg -> Model -> Model
update msg model =
    case msg of
        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] []
