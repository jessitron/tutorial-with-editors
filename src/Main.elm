module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes


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
    | MorePlease


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            model ! []

        Noop ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.h2 [] [ Html.text model.topic ]
        , Html.img [ Html.Attributes.src model.gifUrl ] []
        , Html.button [] [ Html.text "More Please!" ]
        ]
