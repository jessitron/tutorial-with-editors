module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events
import Http
import Task


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
    | FetchSucceed String
    | FetchFail Http.Error


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchSucceed string ->
            model ! []

        FetchFail error ->
            model ! []

        MorePlease ->
            model ! []

        Noop ->
            model ! []


fetch decoder url =
    Task.perform FetchFail FetchSucceed (Http.get decoder url)



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.h2 [] [ Html.text model.topic ]
        , Html.img [ Html.Attributes.src model.gifUrl ] []
        , Html.button [ Html.Events.onClick MorePlease ] [ Html.text "More Please!" ]
        ]
