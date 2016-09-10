module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events
import Http
import Task
import Json.Decode
import Model exposing (Model)
import RandomGif
import Login


main : Program Never
main =
    Html.App.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- MODEL


init =
    let
        ( randomGifModel, randomGifCommands ) =
            RandomGif.init

        loginModel =
            Login.model
    in
        { randomGif = randomGifModel
        , login = loginModel
        }
            ! [ randomGifCommands ]



-- SUBSCRIPTIONS


subscriptions model =
    Sub.batch [ RandomGif.subscriptions model.randomGif ]



-- UPDATE


type Msg
    = Noop
    | RandomGifMsg RandomGif.Msg
    | LoginMsg Login.Msg


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

        LoginMsg loginMsg ->
            let
                loginModel =
                    Login.update loginMsg model.login
            in
                { model | login = loginModel } ! []

        Noop ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.App.map LoginMsg (Login.view model.login)
        , Html.App.map RandomGifMsg (RandomGif.view model.randomGif)
        ]
