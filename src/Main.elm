module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events
import Http
import Task
import Json.Decode
import RandomGif


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
    { randomGif : RandomGif.Model }


init =
    let
        ( randomGifModel, randomGifCommands ) =
            RandomGif.init
    in
        { randomGif = randomGifModel }
            ! [ randomGifCommands ]



-- SUBSCRIPTIONS


subscriptions model =
    Sub.batch [ RandomGif.subscriptions model.randomGif ]



-- UPDATE


type Msg
    = Noop
    | RandomGifMsg RandomGif.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RandomGifMsg randomGifMsg ->
            let
                ( randomGifModel, randomGifCommands ) =
                    RandomGif.update randomGifMsg model.randomGif
            in
                ( { model | randomGif = randomGifModel }
                , Cmd.map RandomGifMsg randomGifCommands
                )

        Noop ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.App.map RandomGifMsg (RandomGif.view model.randomGif) ]
