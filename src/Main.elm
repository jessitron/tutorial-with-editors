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
    { topic : String
    , gifUrl : String
    }


init =
    { topic = "cats"
    , gifUrl = "waiting.gif"
    }
        ! []



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
