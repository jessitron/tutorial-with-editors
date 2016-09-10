module RandomGif exposing (init, Msg, update, view, subscriptions)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events
import Http
import Task
import Json.Decode
import RandomGif.Model exposing (Model)


-- MODEL


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
    = MorePlease
    | FetchSucceed String
    | FetchFail Http.Error


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchSucceed string ->
            { model | gifUrl = string } ! []

        FetchFail error ->
            model ! []

        MorePlease ->
            model ! [ getRandomGif model.topic ]


getRandomGif topic =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic

        decodeGifUrl =
            Json.Decode.at [ "data", "image_url" ] Json.Decode.string
    in
        fetch decodeGifUrl url


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
