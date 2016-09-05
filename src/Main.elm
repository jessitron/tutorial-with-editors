module Main exposing (main)

import Html exposing (Html)
import Html.App


main : Program Never
main =
    Html.App.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { dieFace : Int }


init =
    { dieFace = 6 } ! []



-- SUBSCRIPTIONS


subscriptions model =
    Sub.none



-- UPDATE


type Msg
    = Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [] []
