module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Events
import Random


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
    | Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewFace int ->
            { model | dieFace = int } ! []

        Roll ->
            model ! [ Random.generate NewFace (Random.int 1 6) ]

        Noop ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.h1 [] [ Html.text (toString model.dieFace) ]
        , Html.button [ Html.Events.onClick Roll ] [ Html.text "Roll" ]
        ]
